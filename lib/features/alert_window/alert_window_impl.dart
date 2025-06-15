import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:freebox_remote_controller/features/alert_window/alert_window.dart';

final class AlertWindowImpl implements IAlertWindow {
  static final instance = AlertWindowImpl._();

  AlertWindowImpl._();

  int _width = -1 >>> 1;
  int get _height => (_width * 3 / 4).round();

  Size get _deviceSize =>
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;

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
    final w = WidgetsBinding
        .instance.platformDispatcher.views.first.physicalSize.width;
    setWidth((w / 2).round());

    return FlutterOverlayWindow.showOverlay(
      enableDrag: true,
      width: _width,
      height: _height,
    );
  }

  void setWidth(int width) {
    _width = width;
  }

  void scale(double scaleFactor) {
    _width = (_width * scaleFactor).round();
  }

  @override
  Future<void> updateScale(double scaleFactor) {
    scale(scaleFactor);
    return FlutterOverlayWindow.resizeOverlay(
      _width,
      _height,
      true,
    );
  }

  @override
  Future<bool> isActive() {
    return FlutterOverlayWindow.isActive();
  }
}
