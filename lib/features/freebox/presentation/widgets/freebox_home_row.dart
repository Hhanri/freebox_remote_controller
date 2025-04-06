import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_controller_box.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_input_button_widget.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

class FreeboxHomeRow extends StatelessWidget {
  final FreeboxInputCallback onTap;
  final FreeboxInputCallback onLongPress;
  FreeboxHomeRow({
    super.key,
    required this.onTap,
    required this.onLongPress,
  });

  late final controls = [
    const FreeboxControllerPlaceholderBox(),
    FreeboxInputButtonWidget.text(
      text: "FREE",
      input: FreeboxInputs.home,
      textStyle: const TextStyle(color: Colors.red),
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    const FreeboxControllerPlaceholderBox(),
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
