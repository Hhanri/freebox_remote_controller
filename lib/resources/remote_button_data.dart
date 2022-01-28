import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/models/remote_button_class.dart';
import 'package:freebox_remote_controller/resources/strings.dart';

class RemoteButtonsWidgets {
  static RemoteButton red = RemoteButton(buttonKey: RemoteButtonKeyStrings.red, buttonWidget: RemoteButtonIconWidget.red, backgroundColor: Colors.red);
  static RemoteButton green = RemoteButton(buttonKey: RemoteButtonKeyStrings.green, buttonWidget: RemoteButtonIconWidget.green, backgroundColor: Colors.green);
  static RemoteButton blue = RemoteButton(buttonKey: RemoteButtonKeyStrings.blue, buttonWidget: RemoteButtonIconWidget.blue, backgroundColor: Colors.blue);
  static RemoteButton yellow = RemoteButton(buttonKey: RemoteButtonKeyStrings.yellow, buttonWidget: RemoteButtonIconWidget.yellow, backgroundColor: Colors.yellow);

  static RemoteButton ok = RemoteButton(buttonKey: RemoteButtonKeyStrings.ok, buttonWidget: RemoteButtonIconWidget.ok);

}