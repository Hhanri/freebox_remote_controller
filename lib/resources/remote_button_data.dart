import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/models/remote_button_class.dart';
import 'package:freebox_remote_controller/resources/strings.dart';

class RemoteButtonsWidgets {
  static RemoteButton red = RemoteButton(buttonKey: RemoteButtonKeyStrings.red, buttonWidget: RemoteButtonIconWidget.red, backgroundColor: Colors.red);
  static RemoteButton green = RemoteButton(buttonKey: RemoteButtonKeyStrings.green, buttonWidget: RemoteButtonIconWidget.green, backgroundColor: Colors.green);
  static RemoteButton blue = RemoteButton(buttonKey: RemoteButtonKeyStrings.blue, buttonWidget: RemoteButtonIconWidget.blue, backgroundColor: Colors.blue);
  static RemoteButton yellow = RemoteButton(buttonKey: RemoteButtonKeyStrings.yellow, buttonWidget: RemoteButtonIconWidget.yellow, backgroundColor: Colors.yellow);

  static RemoteButton tv = RemoteButton(buttonKey: RemoteButtonKeyStrings.tv, buttonWidget: RemoteButtonIconWidget.tv);
  static RemoteButton power = RemoteButton(buttonKey: RemoteButtonKeyStrings.power, buttonWidget: RemoteButtonIconWidget.power);

  static RemoteButton n1 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n1, buttonWidget: RemoteButtonIconWidget.n1);
  static RemoteButton n2 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n2, buttonWidget: RemoteButtonIconWidget.n2);
  static RemoteButton n3 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n3, buttonWidget: RemoteButtonIconWidget.n3);
  static RemoteButton n4 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n4, buttonWidget: RemoteButtonIconWidget.n4);
  static RemoteButton n5 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n5, buttonWidget: RemoteButtonIconWidget.n5);
  static RemoteButton n6 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n6, buttonWidget: RemoteButtonIconWidget.n6);
  static RemoteButton n7 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n7, buttonWidget: RemoteButtonIconWidget.n7);
  static RemoteButton n8 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n8, buttonWidget: RemoteButtonIconWidget.n8);
  static RemoteButton n9 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n9, buttonWidget: RemoteButtonIconWidget.n9);
  static RemoteButton n0 = RemoteButton(buttonKey: RemoteButtonKeyStrings.n0, buttonWidget: RemoteButtonIconWidget.n0);

  static RemoteButton ok = RemoteButton(buttonKey: RemoteButtonKeyStrings.ok, buttonWidget: RemoteButtonIconWidget.ok);
  static RemoteButton up = RemoteButton(buttonKey: RemoteButtonKeyStrings.up, buttonWidget: RemoteButtonIconWidget.up);
  static RemoteButton down = RemoteButton(buttonKey: RemoteButtonKeyStrings.down, buttonWidget: RemoteButtonIconWidget.down);
  static RemoteButton left = RemoteButton(buttonKey: RemoteButtonKeyStrings.left, buttonWidget: RemoteButtonIconWidget.left);
  static RemoteButton right = RemoteButton(buttonKey: RemoteButtonKeyStrings.right, buttonWidget: RemoteButtonIconWidget.right);

  static RemoteButton home = RemoteButton(buttonKey: RemoteButtonKeyStrings.home, buttonWidget: RemoteButtonIconWidget.home);
  static RemoteButton mute = RemoteButton(buttonKey: RemoteButtonKeyStrings.mute, buttonWidget: RemoteButtonIconWidget.mute);
  static RemoteButton rec = RemoteButton(buttonKey: RemoteButtonKeyStrings.rec, buttonWidget: RemoteButtonIconWidget.rec);

  static RemoteButton volUp = RemoteButton(buttonKey: RemoteButtonKeyStrings.volUp, buttonWidget: RemoteButtonIconWidget.volUp);
  static RemoteButton volDown = RemoteButton(buttonKey: RemoteButtonKeyStrings.volDown, buttonWidget: RemoteButtonIconWidget.volDown);
  static RemoteButton prgmUp = RemoteButton(buttonKey: RemoteButtonKeyStrings.prgmUp, buttonWidget: RemoteButtonIconWidget.prgmUp);
  static RemoteButton prgmDown = RemoteButton(buttonKey: RemoteButtonKeyStrings.prgmDown, buttonWidget: RemoteButtonIconWidget.prgmDown);

  static RemoteButton backward = RemoteButton(buttonKey: RemoteButtonKeyStrings.backward, buttonWidget: RemoteButtonIconWidget.backward);
  static RemoteButton play = RemoteButton(buttonKey: RemoteButtonKeyStrings.play, buttonWidget: RemoteButtonIconWidget.play);
  static RemoteButton forward = RemoteButton(buttonKey: RemoteButtonKeyStrings.forward, buttonWidget: RemoteButtonIconWidget.forward);

  static RemoteButton placeholder = RemoteButton(buttonKey: RemoteButtonKeyStrings.placeholder, buttonWidget: RemoteButtonIconWidget.placeholder);

}