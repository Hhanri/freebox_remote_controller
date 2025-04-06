import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/enhanced_gesture_detector_handler.dart';

final class HoldEgdHandler extends EnhancedGestureDetectorModel {
  final void Function() whileHolding;
  final Duration delay;

  HoldEgdHandler({
    required this.whileHolding,
    this.delay = const Duration(milliseconds: 200),
  });

  Timer? _periodic;
  bool _holding = false;

  @override
  Widget buildChild(BuildContext context, Widget child) {
    return child;
  }

  @override
  void dispose() {
    _periodic?.cancel();
  }

  @override
  void initState(State<StatefulWidget> state) {}

  @override
  void onLongPressEnd(LongPressEndDetails _) {
    _periodic?.cancel();
    _holding = false;
  }

  @override
  void onLongPressStart(LongPressStartDetails _) {
    if (_holding == true) return;
    _holding = true;
    _periodic = Timer.periodic(
      delay,
      (_) => whileHolding.call(),
    );
  }

  @override
  void onTap() {}
}
