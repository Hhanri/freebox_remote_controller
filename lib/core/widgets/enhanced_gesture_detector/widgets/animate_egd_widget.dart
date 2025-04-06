import 'package:flutter/material.dart';

class AnimateEgdWidget extends StatefulWidget {
  final Widget child;
  final void Function(AnimationController c) animationControllerCallback;
  const AnimateEgdWidget({
    super.key,
    required this.child,
    required this.animationControllerCallback,
  });

  @override
  State<AnimateEgdWidget> createState() => _AnimateEgdWidgetState();
}

class _AnimateEgdWidgetState extends State<AnimateEgdWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.2,
      duration: const Duration(milliseconds: 200),
    )..drive(CurveTween(curve: Curves.easeInOut));
    widget.animationControllerCallback(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.animationControllerCallback(_animationController);
  }

  @override
  void didUpdateWidget(covariant AnimateEgdWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.animationControllerCallback(_animationController);
  }

  @override
  void reassemble() {
    super.reassemble();
    widget.animationControllerCallback(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: 1 - _animationController.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
