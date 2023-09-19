import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class GreenButton extends StatelessWidget {
  final String text;

  //final Color color;

  Function()? onTap;

  GreenButton({
    super.key,
    required this.onTap,
    required this.text,
    //required this.color,
  });

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: AppStyles.buttonCornerCircularRadius5)),
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
