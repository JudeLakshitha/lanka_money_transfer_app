import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  //final Color color;
  final Text title;
  final AppBar appBar;

  const BaseAppBar({super.key, required this.title, required this.appBar});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: title,
      centerTitle: true,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        color: AppColors.appGrey,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      leading: const BackButton(color:  AppColors.appGrey),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
