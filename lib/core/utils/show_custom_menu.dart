import 'package:flutter/material.dart';

Future<void> showCustomMenu<T>({
  required BuildContext context,
  required List<PopupMenuEntry<T>> items,
  Offset offset = Offset.zero,
}) {
  final RenderBox button = context.findRenderObject()! as RenderBox;
  final RenderBox overlay =
      Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(offset, ancestor: overlay),
      button.localToGlobal(
        button.size.bottomRight(Offset.zero) + offset,
        ancestor: overlay,
      ),
    ),
    Offset.zero & overlay.size,
  );

  return showMenu<T>(
    context: context,
    position: position,
    items: items,
  );
}
