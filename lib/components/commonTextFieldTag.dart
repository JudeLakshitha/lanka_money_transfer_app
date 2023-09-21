import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class TextFieldTag extends StatelessWidget {
  final String text;

  const TextFieldTag({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppColors.appGrey,
          //fontFamily: 'Poppins',
        ));
  }
}
