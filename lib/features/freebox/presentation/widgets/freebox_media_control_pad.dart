import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_controller_box.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_input_button_widget.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

class FreeboxMediaControlPad extends StatelessWidget {
  final FreeboxInputCallback onTap;
  final FreeboxInputCallback onLongPress;
  FreeboxMediaControlPad({
    super.key,
    required this.onTap,
    required this.onLongPress,
  });

  late final List<FreeboxControllerBox> controls = [
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.volUp,
      iconData: Icons.add,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.mute,
      iconData: Icons.volume_off,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.prgmUp,
      iconData: Icons.add,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    const FreeboxControllerTextBox(text: "VOL"),
    const FreeboxControllerPlaceholderBox(),
    const FreeboxControllerTextBox(text: "PROG"),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.volDown,
      iconData: Icons.remove,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.rec,
      color: Colors.red,
      iconData: Icons.fiber_manual_record,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.prgmDown,
      iconData: Icons.remove,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.backward,
      iconData: Icons.fast_rewind,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.play,
      iconData: Icons.play_arrow,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.icon(
      input: FreeboxInputs.forward,
      iconData: Icons.fast_forward,
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
