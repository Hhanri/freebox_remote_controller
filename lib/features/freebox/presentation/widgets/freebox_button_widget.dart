import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/animate_egd_handler.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/enhanced_gesture_detector_handler.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/hold_egd_handler.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/handlers/tap_egd_handler.dart';
import 'package:freebox_remote_controller/core/widgets/enhanced_gesture_detector/widgets/enhanced_gesture_detector.dart';

abstract base class FreeboxButtonWidget extends StatefulWidget {
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

  @override
  State<FreeboxButtonWidget> createState() => _FreeboxButtonWidgetState();
}

class _FreeboxButtonWidgetState extends State<FreeboxButtonWidget> {
  late final List<EnhancedGestureDetectorModel> handlers;

  @override
  void initState() {
    super.initState();
    handlers = [
      AnimateEgdHandler(),
      if (widget.onTap != null) TapEgdHandler(onPressed: widget.onTap!),
      if (widget.onLongPress != null)
        HoldEgdHandler(whileHolding: widget.onLongPress!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return EnhancedGestureDetector(
      models: handlers,
      child: ColoredBox(
        color: widget.backgroundColor,
        child: FittedBox(
          child: Center(
            child: widget.childBuilder(context),
          ),
        ),
      ),
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
