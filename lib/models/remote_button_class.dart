import 'package:flutter/material.dart';

class RemoteButton {
  final String buttonKey;
  final Widget buttonWidget;
  Color? backgroundColor = Colors.transparent;

  RemoteButton({
    required this.buttonKey,
    required this.buttonWidget,
    this.backgroundColor,
  });
}