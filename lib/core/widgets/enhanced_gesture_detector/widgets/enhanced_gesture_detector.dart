import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/enhanced_gesture_detector_handler.dart';

class EnhancedGestureDetector extends StatefulWidget {
  final Widget child;
  final List<EnhancedGestureDetectorModel> models;
  const EnhancedGestureDetector({
    super.key,
    required this.models,
    required this.child,
  });

  @override
  State<EnhancedGestureDetector> createState() =>
      _EnhancedGestureDetectorState();
}

class _EnhancedGestureDetectorState extends State<EnhancedGestureDetector>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    for (final m in widget.models) {
      m.initState(this);
    }
  }

  @override
  void dispose() {
    for (final m in widget.models) {
      m.dispose();
    }
    super.dispose();
  }

  void _onTap() {
    for (final m in widget.models) {
      m.onTap();
    }
  }

  void _onLongPressStart(LongPressStartDetails _) {
    for (final m in widget.models) {
      m.onLongPressStart(_);
    }
  }

  void _onLongPressEnd(LongPressEndDetails _) {
    for (final m in widget.models) {
      m.onLongPressEnd(_);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onLongPressStart: _onLongPressStart,
      onLongPressEnd: _onLongPressEnd,
      child: widget.models.fold(
        widget.child,
        (curr, next) => next.buildChild(context, curr!),
      ),
    );
  }
}
