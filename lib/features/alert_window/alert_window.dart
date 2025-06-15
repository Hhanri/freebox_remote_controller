import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/alert_window/alert_window_impl.dart';

abstract interface class IAlertWindow {
  factory IAlertWindow() {
    return AlertWindowImpl.instance;
  }

  Future<void> init();

  Future<bool> setup();

  Future<void> show(BuildContext context);

  Future<void> hide();

  Future<bool> isActive();
}
