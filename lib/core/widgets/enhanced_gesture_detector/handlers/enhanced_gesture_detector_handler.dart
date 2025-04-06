import 'package:flutter/material.dart';

abstract base class EnhancedGestureDetectorModel {
  void initState(State state);
  void dispose();

  void onLongPressStart(LongPressStartDetails _);
  void onLongPressEnd(LongPressEndDetails _);
  void onTap();

  Widget buildChild(BuildContext context, Widget child);
}
