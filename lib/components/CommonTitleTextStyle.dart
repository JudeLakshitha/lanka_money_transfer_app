import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class CommonTitleTextStyle extends StatelessWidget {
  final String text;

  const CommonTitleTextStyle(
      {super.key,
        required this.text,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: AppColors.appGrey,
      ),
    );
  }
}
