import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_controller_box.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_input_button_widget.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

class FreeboxNumpad extends StatelessWidget {
  final FreeboxInputCallback onTap;
  final FreeboxInputCallback onLongPress;
  FreeboxNumpad({
    super.key,
    required this.onTap,
    required this.onLongPress,
  });

  late final List<FreeboxControllerBox> numPad = [
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n1,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n2,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n3,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n4,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n5,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n6,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n7,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n8,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n9,
      onTap: onTap,
      onLongPress: onLongPress,
    ),
    const FreeboxControllerPlaceholderBox(),
    FreeboxInputButtonWidget.text(
      input: FreeboxInputs.n0,
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
        return numPad[index];
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 30 / 11,
      ),
      itemCount: numPad.length,
    );
  }
}
