import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/enhanced_gesture_detector_handler.dart';

final class TapEgdHandler extends EnhancedGestureDetectorModel {
  final void Function() onPressed;

  TapEgdHandler({
    required this.onPressed,
  });

  @override
  Widget buildChild(BuildContext context, Widget child) {
    return child;
  }

  @override
  void dispose() {}

  @override
  void initState(State<StatefulWidget> state) {}

  @override
  void onLongPressEnd(LongPressEndDetails _) {}

  @override
  void onLongPressStart(LongPressStartDetails _) {}

  @override
  void onTap() {
    onPressed();
  }
}
