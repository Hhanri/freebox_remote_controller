import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/services/api_service.dart';

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
          APIService.buttonFunction(buttonKey: buttonKey, context: context,longPress: false);
        },
        onLongPress: () {
          APIService.buttonFunction(buttonKey: buttonKey, context: context,longPress: true);
        },
        child: Ink(
          child: FittedBox(
            child: Center(
              child: icon
            ),
          ),
        ),
      ),
    );
  }
}