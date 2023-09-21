import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class BaseCheckbox extends StatefulWidget {
  const BaseCheckbox({
    super.key,
  });

  @override
  State<BaseCheckbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<BaseCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.appGreen;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: AppColors.appGreen,
        shape: RoundedRectangleBorder(
            borderRadius: AppStyles.buttonCornerCircularRadius5),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
