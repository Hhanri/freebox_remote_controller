import 'dart:async';

import 'package:flutter/material.dart';

class HoldableWidget extends StatefulWidget {
  final void Function()? onTap;
  final void Function()? whileHolding;
  final Duration delay;
  final Widget Function(BuildContext conntext) childBuilder;

  const HoldableWidget({
    required this.childBuilder,
    this.onTap,
    this.whileHolding,
    this.delay = const Duration(milliseconds: 200),
    super.key,
  });

  @override
  State<HoldableWidget> createState() => _HoldableWidgetState();
}

class _HoldableWidgetState extends State<HoldableWidget>
    with SingleTickerProviderStateMixin {
  Timer? _periodic;
  bool _holding = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.2,
      duration: const Duration(milliseconds: 200),
    )
      ..drive(CurveTween(curve: Curves.easeInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && _holding == false) {
          _animationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _periodic?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _onLongPressStart(LongPressStartDetails _) {
    if (_holding == true || widget.whileHolding == null) return;
    _holding = true;
    _periodic = Timer.periodic(
      widget.delay,
      (_) => widget.whileHolding?.call(),
    );
  }

  void _onLongPressEnd(LongPressEndDetails _) {
    _periodic?.cancel();
    _holding = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward();
        widget.onTap?.call();
      },
      onLongPressStart: (_) {
        _animationController.forward();
        _onLongPressStart(_);
      },
      onLongPressEnd: (_) {
        _onLongPressEnd(_);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: 1 - _animationController.value,
            child: child,
          );
        },
        child: widget.childBuilder(context),
      ),
    );
  }
}
