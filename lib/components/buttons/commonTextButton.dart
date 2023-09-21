import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  final Color color;

  const CommonTextButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: AppColors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ));
  }
}

class CommonTextButtonBold extends StatelessWidget {
  final String text;
  final Color color;

  const CommonTextButtonBold(
      {super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: AppColors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, color: color, fontWeight: FontWeight.bold),
        ));
  }
}
