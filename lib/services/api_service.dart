import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/resources/strings.dart';
import 'package:freebox_remote_controller/services/remote_controller_code_service.dart';
import 'package:http/http.dart';

class APIService {
  static void buttonFunction({required String buttonKey, required bool longPress, required BuildContext context}) async {
    int code = await RemoteCodeControllerPreferences.loadCode();
    if (code != RemoteCodeControllerPreferences.nullCode) {
      await get(Uri.parse('http://hd1.freebox.fr/pub/remote_control?code=$code&key=$buttonKey&long=$longPress'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBarWidgets.noCodeRegisteredSnackBar);
    }
  }
}

class SnackBarWidgets {
  static const SnackBar noCodeRegisteredSnackBar = SnackBar(
    content: Text(
        SystemStrings.noCodeRegisteredSnackBar
    ),
    duration: Duration(milliseconds: 700),
  );
  static const SnackBar codeRegisteredSuccessfullySnackBar = SnackBar(
    content: Text(
      SystemStrings.codeRegisteredSuccessfullySnackBar
    ),
    duration: Duration(milliseconds: 700),
  );
}