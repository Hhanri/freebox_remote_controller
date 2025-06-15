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
    if (await isActive() == true) return;

    final mq =
        WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
    final w = mq.width / 2;
    final h = w * 3 / 4;

    await FlutterOverlayWindow.showOverlay(
      enableDrag: true,
      width: w.round(),
      height: h.round(),
    );
  }

  @override
  Future<bool> isActive() {
    return FlutterOverlayWindow.isActive();
  }
}
