import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool passwordVisibility;
  final IconButton suffixIconButton;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.passwordVisibility,
    required this.suffixIconButton,
  });

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  //static BorderRadius cornerRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: widget.controller,
          obscureText: widget.passwordVisibility,
          enableSuggestions: false,
          autocorrect: false,
          enableInteractiveSelection: false,
          style: const TextStyle(color: AppColors.appGrey),
          cursorColor: AppColors.appGrey,
          decoration: InputDecoration(

              prefixIcon:
                  const ImageIcon(AssetImage("assets/icons/icon_password.png")),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.red),
                borderRadius: AppStyles.textFieldCornerCircularRadius10,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.red),
                borderRadius: AppStyles.textFieldCornerCircularRadius10,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyShade400),
                borderRadius: AppStyles.textFieldCornerCircularRadius10,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyShade400),
                borderRadius: AppStyles.textFieldCornerCircularRadius10,
              ),
              filled: false,
              prefixIconColor: AppColors.appGrey,
              suffixIcon: widget.suffixIconButton),
        ),
      ),
    );
  }
}
