import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.child,
      required this.textSize,
      required this.bold});
  final Widget child;
  final double textSize;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          fontSize: textSize,
          color: Colors.white,
          fontWeight: bold ? FontWeight.bold : null),
      child: child,
    );
  }
}
