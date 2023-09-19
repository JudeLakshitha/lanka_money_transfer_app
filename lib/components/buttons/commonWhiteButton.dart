import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class WhiteButton extends StatelessWidget {
  final String text;

  //final Color color;

  Function()? onTap;

  WhiteButton({
    super.key,
    required this.onTap,
    required this.text,
    //required this.color,
  });

  @override
  Widget build(context) {
    return SizedBox(
      width: 161,
      height: 36,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              side: const BorderSide(
            color: AppColors.appBlue,
          )),
          child: Text(text),
        ),
      ),
    );
  }
}
