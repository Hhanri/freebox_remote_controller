import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_button_widget.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

class FreeboxHomeRow extends StatelessWidget {
  final FreeboxInputCallback onTap;
  final FreeboxInputCallback onLongPress;
  const FreeboxHomeRow({
    super.key,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: FreeboxButtonWidget.text(
          input: FreeboxInputs.home,
          textStyle: const TextStyle(
            color: Colors.redAccent,
          ),
          onTap: onTap,
          onLongPress: onLongPress,
        ),
      ),
    );
  }
}
