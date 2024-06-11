import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_button_widget.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_controller_box.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

class FreeboxMediaControlRow extends StatelessWidget {
  final FreeboxInputCallback onTap;
  final FreeboxInputCallback onLongPress;
  FreeboxMediaControlRow({
    super.key,
    required this.onTap,
    required this.onLongPress,
  });

  late final List<FreeboxControllerBox> controls = [
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.backward,
      iconData: Icons.fast_rewind,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
      input: FreeboxInputs.play,
      iconData: Icons.play_arrow,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxButtonWidget.icon(
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
