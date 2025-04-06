import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/enhanced_gesture_detector_handler.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/widgets/animate_egd_widget.dart';

final class AnimateEgdHandler extends EnhancedGestureDetectorModel {
  AnimationController? _animationController;

  @override
  Widget buildChild(BuildContext context, Widget child) {
    final widget = AnimateEgdWidget(
      child: child,
      animationControllerCallback: (c) {
        _animationController = c;
      },
    );

    return widget;
  }

  @override
  void dispose() {}

  @override
  void initState(State state) {}

  @override
  void onLongPressEnd(LongPressEndDetails _) {
    _animationController?.reverse();
  }

  @override
  void onLongPressStart(LongPressStartDetails _) {
    _animationController?.forward();
  }

  @override
  void onTap() async {
    await _animationController?.forward();
    await _animationController?.reverse();
  }
}
