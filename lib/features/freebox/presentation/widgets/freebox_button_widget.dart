import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_controller_box.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

typedef FreeboxInputCallback = void Function(FreeboxInput input);

abstract base class FreeboxButtonWidget extends FreeboxControllerBox {
  final FreeboxInput input;
  final Color backgroundColor;

  final FreeboxInputCallback onTap;
  final FreeboxInputCallback onLongPress;

  Widget childBuilder(BuildContext context);

  const FreeboxButtonWidget({
    super.key,
    required this.input,
    this.backgroundColor = Colors.transparent,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(input),
      onLongPress: () => onLongPress(input),
      child: ColoredBox(
        color: backgroundColor,
        child: FittedBox(
          child: Center(
            child: childBuilder(context),
          ),
        ),
      ),
    );
  }

  factory FreeboxButtonWidget.text({
    required FreeboxInput input,
    required FreeboxInputCallback onTap,
    required FreeboxInputCallback onLongPress,
    TextStyle? textStyle,
  }) {
    return FreeboxTextButton(
      input: input,
      onTap: onTap,
      onLongPress: onLongPress,
      textStyle: textStyle,
    );
  }

  factory FreeboxButtonWidget.icon({
    required FreeboxInput input,
    required IconData iconData,
    required FreeboxInputCallback onTap,
    required FreeboxInputCallback onLongPress,
    Color color = Colors.white,
    Color backgroundColor = Colors.transparent,
  }) {
    return FreeboxIconButton(
      input: input,
      iconData: iconData,
      onTap: onTap,
      onLongPress: onLongPress,
      color: color,
      backgroundColor: backgroundColor,
    );
  }
}

final class FreeboxTextButton extends FreeboxButtonWidget {
  final TextStyle? textStyle;
  const FreeboxTextButton({
    super.key,
    this.textStyle,
    required super.input,
    required super.onTap,
    required super.onLongPress,
  });

  @override
  Widget childBuilder(BuildContext context) {
    return Text(
      input.value,
      style: textStyle,
    );
  }
}

final class FreeboxIconButton extends FreeboxButtonWidget {
  final IconData iconData;
  final Color color;

  const FreeboxIconButton({
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
