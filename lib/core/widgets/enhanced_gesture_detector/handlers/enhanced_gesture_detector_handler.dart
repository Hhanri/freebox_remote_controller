import 'package:flutter/material.dart';

abstract base class EnhancedGestureDetectorModel {
  void initState(State state);
  void dispose();
  void reassemble(State state);
  void didChangeDependencies(State state);
  void didUpdateWidget(State state);

  void onLongPressStart(LongPressStartDetails _);
  void onLongPressEnd(LongPressEndDetails _);
  void onTap();

  Widget buildChild(BuildContext context, Widget child);
}
