import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_button_widget.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

typedef FreeboxInputCallback = void Function(FreeboxInput input);

abstract base class FreeboxInputButtonWidget extends FreeboxButtonWidget {
  final FreeboxInput input;

  const FreeboxInputButtonWidget({
    super.key,
    required this.input,
    required super.onTap,
    required super.onLongPress,
    super.backgroundColor,
  });

  factory FreeboxInputButtonWidget.text({
    required FreeboxInput input,
    required FreeboxInputCallback onTap,
    required FreeboxInputCallback onLongPress,
    String? text,
    TextStyle? textStyle,
  }) {
    return FreeboxTextInputButton(
      text: text,
      input: input,
      onTap: () => onTap(input),
      onLongPress: () => onLongPress(input),
      textStyle: textStyle,
    );
  }

  factory FreeboxInputButtonWidget.icon({
    required FreeboxInput input,
    required IconData iconData,
    required FreeboxInputCallback onTap,
    required FreeboxInputCallback onLongPress,
    Color color = Colors.white,
    Color backgroundColor = Colors.transparent,
  }) {
    return FreeboxIconInputButton(
      input: input,
      iconData: iconData,
      onTap: () => onTap(input),
      onLongPress: () => onLongPress(input),
      color: color,
      backgroundColor: backgroundColor,
    );
  }
}

final class FreeboxTextInputButton extends FreeboxInputButtonWidget {
  final String? text;
  final TextStyle? textStyle;
  const FreeboxTextInputButton({
    super.key,
    this.text,
    this.textStyle,
    required super.input,
    required super.onTap,
    required super.onLongPress,
  });

  @override
  Widget childBuilder(BuildContext context) {
    return Text(
      text ?? input.value,
      style: textStyle,
    );
  }
}

final class FreeboxIconInputButton extends FreeboxInputButtonWidget {
  final IconData iconData;
  final Color color;

  const FreeboxIconInputButton({
    super.key,
    required super.input,
    required super.onTap,
    required super.onLongPress,
    required this.iconData,
    this.color = Colors.white,
    super.backgroundColor,
  });

  @override
  Widget childBuilder(BuildContext context) {
    return Icon(
      iconData,
      color: color,
    );
  }
}
