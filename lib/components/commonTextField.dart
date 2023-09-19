import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class CommonTextField extends StatefulWidget {
  final TextInputType textInputType;
  final TextEditingController controller;
  final ImageIcon prefixIcon;
  final Icon suffixIcon;
  final bool validation;

  const CommonTextField({
    super.key,
    required this.textInputType,
    required this.controller,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.validation,
  });

  @override
  CommonTextFieldState createState() => CommonTextFieldState();
}

class CommonTextFieldState extends State<CommonTextField> {
  Color validateIconColor = AppColors.appGrey;
  Color borderColor = AppColors.appGrey;
  late String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: widget.controller,
          onChanged: (value) {
            value.isNotEmpty
                ? validateIconColor = AppColors.appGreen
                : validateIconColor = AppColors.appGrey;
          },
          decoration: InputDecoration(
            errorText: widget.validation ? 'This field cannot be empty' : null,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.red),
              borderRadius: AppStyles.textFieldCornerCircularRadius10,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.red),
              borderRadius: AppStyles.textFieldCornerCircularRadius10,
            ),
            prefixIcon: widget.prefixIcon,
            prefixIconColor: AppColors.appGrey,
            suffixIcon: widget.suffixIcon,
            suffixIconColor: validateIconColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyShade400),
              borderRadius: AppStyles.textFieldCornerCircularRadius10,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyShade400),
              borderRadius: AppStyles.textFieldCornerCircularRadius10,
            ),
            filled: false,
          ),
          cursorColor: AppColors.appGrey,
          keyboardType: widget.textInputType,
          style: const TextStyle(color: AppColors.appGrey),
        ),
      ),
    );
  }
}
