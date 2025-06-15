import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:freebox_remote_controller/features/alert_window/alert_window.dart';

final class AlertWindowImpl implements IAlertWindow {
  static final instance = AlertWindowImpl._();

  AlertWindowImpl._();

  @override
  Future<void> hide() {
    return FlutterOverlayWindow.closeOverlay();
  }

  @override
  Future<void> init() async {}

  @override
  Future<bool> setup() async {
    final enabled = await FlutterOverlayWindow.isPermissionGranted();
    if (enabled == true) return true;
    final requestRes = await FlutterOverlayWindow.requestPermission();
    return requestRes ?? false;
  }

  @override
  Future<void> show(BuildContext context) async {
    final mq =
        WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
    final w = mq.width;
    final h = mq.height;
    if (await isActive() == true) return;
    await FlutterOverlayWindow.showOverlay(
      enableDrag: true,
      width: (w / 3).round(),
      height: (h / 3).round(),
    );
  }

  @override
  Future<bool> isActive() {
    return FlutterOverlayWindow.isActive();
  }
}
