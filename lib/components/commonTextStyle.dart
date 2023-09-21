import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class CommonTextStyle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const CommonTextStyle({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    );
  }
}

class CommonTextStyleBold extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const CommonTextStyleBold({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
