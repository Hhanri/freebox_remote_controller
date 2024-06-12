import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_input_button_widget.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_settings_button.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

class FreeboxPowerRow extends StatelessWidget {
  final FreeboxInputCallback onTap;
  final FreeboxInputCallback onLongPress;
  FreeboxPowerRow({
    super.key,
    required this.onTap,
    required this.onLongPress,
  });

  late final List<Widget> controls = [
    FreeboxInputButtonWidget.text(
      text: "AV",
      input: FreeboxInputs.tv,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    const FreeboxSettingsButton(),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.power,
      iconData: Icons.power_settings_new,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return controls[index];
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 30 / 11,
      ),
      itemCount: controls.length,
    );
  }
}
