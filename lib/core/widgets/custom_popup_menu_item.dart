import 'package:flutter/material.dart';

class CustomPopupMenuItem extends StatelessWidget {
  final IconData icon;

  final String text;
  const CustomPopupMenuItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
