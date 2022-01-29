import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/utils/navigation_utils.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          NavigationUtils.showSettingsDialog(context: context);
        },
        child: Ink(
          child: const FittedBox(
            child: Center(
              child: Icon(
                Icons.settings
              ),
            )
          ),
        )
      ),
    );
  }
}


