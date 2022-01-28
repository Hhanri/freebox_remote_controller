import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/resources/strings.dart';
import 'package:http/http.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RemoteButtonWidget(buttonKey: RemoteButtonKeyStrings.red, icon: RemoteButtonIconWidget.red, color: Colors.red,),
      ),
    );
  }
}

class RemoteButtonWidget extends StatelessWidget {
  final Widget icon;
  final String buttonKey;
  final Color color;
  const RemoteButtonWidget({
    Key? key,
    required this.icon,
    required this.buttonKey,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: () {
          buttonFunction(buttonKey, false);
        },
        onLongPress: () {
          buttonFunction(buttonKey, true);
        },
        child: Ink(
          child: icon,
        ),
      ),
    );
  }
  void buttonFunction(String buttonKey, bool longPress) async {
    await get(Uri.parse('http://hd1.freebox.fr/pub/remote_control?code=33128888&key=$buttonKey&long=$longPress'));
  }
}
