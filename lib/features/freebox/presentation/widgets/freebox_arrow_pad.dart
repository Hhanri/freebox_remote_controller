import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_button_widget.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_controller_box.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

class FreeboxArrowPad extends StatelessWidget {
  final FreeboxInputCallback onTap;
  final FreeboxInputCallback onLongPress;
  FreeboxArrowPad({
    super.key,
    required this.onTap,
    required this.onLongPress,
  });

  late final List<FreeboxControllerBox> controls = [
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.red,
      iconData: Icons.arrow_back_ios_new,
      backgroundColor: Colors.red,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.up,
      iconData: Icons.keyboard_arrow_up,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.blue,
      iconData: Icons.search,
      backgroundColor: Colors.blue,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.left,
      iconData: Icons.keyboard_arrow_left,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.text(
      text: "OK",
      input: FreeboxInputs.ok,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.right,
      iconData: Icons.keyboard_arrow_right,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.green,
      iconData: Icons.list_alt,
      backgroundColor: Colors.green,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.down,
      iconData: Icons.keyboard_arrow_down,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.yellow,
      iconData: Icons.info_outline,
      backgroundColor: Colors.yellow,
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
