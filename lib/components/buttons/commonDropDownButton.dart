import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

const List<String> list = <String>['Sri Lanka', 'Germany', 'Ireland', 'Canada' ,'United State of America' ,'United Kingdom' ];

class BaseDropDownButton extends StatefulWidget {
  //final List<String> dropDownList;

  const BaseDropDownButton({
    super.key,
    // required this.dropDownList,
  });

  @override
  State<BaseDropDownButton> createState() => BaseDropDownButtonState();
}

class BaseDropDownButtonState extends State<BaseDropDownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        height: 50,
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<String>(
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
                  contentPadding: EdgeInsets.zero),
              icon: const ImageIcon(AssetImage("assets/icons/arrow_back_icon.png")),
              //elevation: 16,
              style: const TextStyle(
                color: AppColors.appGrey,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
