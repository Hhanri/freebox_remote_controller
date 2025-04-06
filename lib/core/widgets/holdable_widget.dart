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

class _HoldableWidgetState extends State<HoldableWidget> {
  Timer? _periodic;
  bool _holding = false;

  @override
  void dispose() {
    _periodic?.cancel();
    super.dispose();
  }

  void _onLongPressStart(LongPressStartDetails _) {
    if (_holding == true || widget.whileHolding == null) return;
    print("start long press");
    _holding = true;
    _periodic = Timer.periodic(
      widget.delay,
      (_) => widget.whileHolding?.call(),
    );
  }

  void _onLongPressEnd(LongPressEndDetails _) {
    print("stop long press");
    _periodic?.cancel();
    _holding = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPressStart: _onLongPressStart,
      onLongPressEnd: _onLongPressEnd,
      child: widget.childBuilder(context),
    );
  }
}
