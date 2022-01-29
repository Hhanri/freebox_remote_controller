import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/utils/navigation_utils.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        NavigationUtils.showSettingsDialog(context: context);
      },
      icon: const Icon(Icons.settings)
    );
  }
}


