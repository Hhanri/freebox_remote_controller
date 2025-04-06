import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/enhanced_gesture_detector_handler.dart';

final class AnimateEgdHandler extends EnhancedGestureDetectorModel {
  late AnimationController _animationController;

  @override
  Widget buildChild(BuildContext context, Widget child) {
    final widget = AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: 1 - _animationController.value,
          child: child,
        );
      },
      child: child,
    );

    return widget;
  }

  @override
  void dispose() {}

  @override
  void initState(State state) {
    _animationController = AnimationController(
      vsync: state as TickerProvider,
      lowerBound: 0.0,
      upperBound: 0.2,
      duration: const Duration(milliseconds: 200),
    )..drive(CurveTween(curve: Curves.easeInOut));
  }

  @override
  void onLongPressEnd(LongPressEndDetails _) {
    _animationController.reverse();
  }

  @override
  void onLongPressStart(LongPressStartDetails _) {
    _animationController.forward();
  }

  @override
  void onTap() async {
    await _animationController.forward();
    await _animationController.reverse();
  }

  @override
  void didChangeDependencies(State<StatefulWidget> state) {
    _animationController.resync(state as TickerProvider);
  }

  @override
  void didUpdateWidget(State<StatefulWidget> state) {
    _animationController.resync(state as TickerProvider);
  }

  @override
  void reassemble(State<StatefulWidget> state) {
    _animationController.resync(state as TickerProvider);
  }
}
