import 'package:flutter/material.dart';

import '../utils/style.dart';

Image logoWidget(context, String imageName) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: screenWidth / 2,
    height: screenHeight / 3.75,
    alignment: Alignment.center,
  );
}

TextField baseTextField(
    TextEditingController textEditingController,
    ImageIcon prefixIcon,
    ImageIcon suffixIcon,
    TextInputType textInputType,
    String errorText) {
  bool fieldIsEmpty;
  Color suffixIconColor;
  textEditingController.text.isEmpty
      ? fieldIsEmpty = true
      : fieldIsEmpty = false;
  textEditingController.text.isEmpty
      ? suffixIconColor = AppColors.appGrey
      : suffixIconColor = AppColors.appGreen;

  return TextField(
    controller: textEditingController,
    enableSuggestions: true,
    //autocorrect: true,
    cursorColor: AppColors.appGrey,
    keyboardType: textInputType,
    onChanged: (value) {},
    style: const TextStyle(
      color: AppColors.appGrey,
    ),
    decoration: InputDecoration(
    //errorText:validation? errorText :null,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: AppStyles.textFieldCornerCircularRadius10,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: AppStyles.textFieldCornerCircularRadius10,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.appGrey,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyShade400),
          borderRadius: AppStyles.textFieldCornerCircularRadius10,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyShade400),
          borderRadius: AppStyles.textFieldCornerCircularRadius10,
        ),
        filled: false,
        contentPadding: EdgeInsets.zero),
  );
}

DropdownButtonFormField dropdownButtonFormField(List<String> list, ImageIcon prefixIcon, ImageIcon suffixIcon) {
  String dropdownValue = list.first;

  return DropdownButtonFormField(
    value: dropdownValue,
    menuMaxHeight: 300,
    iconEnabledColor: AppColors.appGrey,
    alignment: Alignment.centerLeft,
    decoration: InputDecoration(
        //errorText: widget.validation ? 'This field cannot be empty' : null,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: AppStyles.textFieldCornerCircularRadius10,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: AppStyles.textFieldCornerCircularRadius10,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.appGrey,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyShade400),
          borderRadius: AppStyles.textFieldCornerCircularRadius10,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyShade400),
          borderRadius: AppStyles.textFieldCornerCircularRadius10,
        ),
        filled: false,
        contentPadding: EdgeInsets.zero
    ),
    //icon: const ImageIcon(AssetImage("assets/icons/arrow_back_icon.png")),
    icon: suffixIcon,
    //elevation: 16,
    style: const TextStyle(
      color: AppColors.appGrey,
    ),
    onChanged: (value) {
      // This is called when the user selects an item.
      // setState(() {
      //   dropdownValue = value!;
      // });
    },
    items: list.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}

Text baseText(String text, FontWeight fontWeight, Color color) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 12,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

TextField passwordTextField(TextEditingController controller, bool obscureText,
    FocusNode focusNode, VoidCallback? toggleObscureText) {
  Color visibilityColor = AppColors.appGrey;
  return TextField(
    controller: controller,
    obscureText: obscureText,
    enableSuggestions: false,
    autocorrect: false,
    focusNode: focusNode,
    enableInteractiveSelection: false,
    style: const TextStyle(color: AppColors.appGrey),
    cursorColor: AppColors.appGrey,
    decoration: InputDecoration(
      prefixIcon: const ImageIcon(AssetImage("assets/icons/icon_password.png")),
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
      contentPadding: EdgeInsets.zero,
      prefixIconColor: AppColors.appGrey,
      suffixIcon: IconButton(
        onPressed: toggleObscureText,
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        color: obscureText
            ? visibilityColor = AppColors.appGrey
            : visibilityColor = AppColors.appGreen,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    ),
  );
}

Checkbox baseCheckBox(bool isChecked){
  return Checkbox(
      value: isChecked,
      onChanged: (value) {

      },
  );
}