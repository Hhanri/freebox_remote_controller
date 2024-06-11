import 'package:flutter/material.dart';

abstract base class FreeboxControllerBox extends StatelessWidget {
  const FreeboxControllerBox({super.key});
}

final class FreeboxControllerTextBox extends FreeboxControllerBox {
  final String text;

  const FreeboxControllerTextBox({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

final class FreeboxControllerPlaceholderBox extends FreeboxControllerBox {
  const FreeboxControllerPlaceholderBox({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
