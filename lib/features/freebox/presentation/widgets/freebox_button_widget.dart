import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_controller_box.dart';

abstract base class FreeboxButtonWidget extends FreeboxControllerBox {
  final Color backgroundColor;
  final void Function()? onTap;
  final void Function()? onLongPress;

  Widget childBuilder(BuildContext context);

  const FreeboxButtonWidget({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
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

  factory FreeboxButtonWidget.icon({
    required IconData iconData,
    void Function()? onTap,
    void Function()? onLongPress,
    Color color = Colors.white,
    Color backgroundColor = Colors.transparent,
  }) {
    return FreeboxIconButton(
      iconData: iconData,
      onTap: onTap,
      onLongPress: onLongPress,
      color: color,
      backgroundColor: backgroundColor,
    );
  }
}

final class FreeboxIconButton extends FreeboxButtonWidget {
  final IconData iconData;
  final Color color;

  const FreeboxIconButton({
    super.key,
    super.backgroundColor,
    super.onTap,
    super.onLongPress,
    required this.iconData,
    required this.color,
  });

  @override
  Widget childBuilder(BuildContext context) {
    return Icon(
      iconData,
      color: color,
    );
  }
}
