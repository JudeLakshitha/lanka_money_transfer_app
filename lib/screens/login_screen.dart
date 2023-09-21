import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/components/CommonTitleTextStyle.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonBlueButton.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonGreenButton.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonTextButton.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonWhiteButton.dart';
import 'package:lanka_money_transfer_app/components/commonAppBar.dart';
import 'package:lanka_money_transfer_app/components/commonTextField.dart';
import 'package:lanka_money_transfer_app/components/commonTextFieldTag.dart';
import 'package:lanka_money_transfer_app/components/commonTextStyle.dart';
import 'package:lanka_money_transfer_app/components/passwordTextField.dart';

import '../utils/style.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _userNameValidate = false;
  bool _passwordValidate = false;
  bool passwordVisibility = true;
  Color _visibilityColor = AppColors.appGrey;

  void signUserIn() {
    setState(() {
      widget.usernameController.text.isEmpty
          ? _userNameValidate = true
          : _userNameValidate = false;
      widget.passwordController.text.isEmpty
          ? _passwordValidate = true
          : _passwordValidate = false;
    });
  }

  @override
  void dispose() {
    //widget.usernameController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: const Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(width: double.infinity),
              Container(
                width: screenWidth / 2,
                height: screenHeight / 3.75,
                alignment: Alignment.center,
                child: Image.asset('assets/images/login_screen_image.png'),
              ),
              const CommonTitleTextStyle(text: 'Login'),
              const SizedBox(height: 8.0),
              const CommonTextStyle(
                text: 'Welcome to Lanka Money Transfer',
                color: AppColors.appGrey,
                fontSize: 12,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Username'),
                ),
              ),
              const SizedBox(height: 8.0),
              CommonTextField(
                textInputType: TextInputType.text,
                controller: widget.usernameController,
                validation: _userNameValidate,
                prefixIcon:
                    const ImageIcon(AssetImage("assets/icons/icon_at.png")),
                suffixIcon: const Icon(Icons.check_circle_outline),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Password'),
                ),
              ),
              const SizedBox(height: 8.0),
              PasswordTextField(
                controller: widget.passwordController,
                passwordVisibility: passwordVisibility,
                suffixIconButton: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                      passwordVisibility
                          ? _visibilityColor = AppColors.appGrey
                          : _visibilityColor = AppColors.appGreen;
                    });
                  },
                  icon: Icon(passwordVisibility
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: _visibilityColor,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 20),
              GreenButton(
                onTap: () {
                  signUserIn();
                },
                text: 'Login',
              ),
              const SizedBox(height:5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextStyle(
                      text: 'Cannot remember password?',
                      color: AppColors.appGrey,
                      fontSize: 12,
                    ),
                    // CommonTextStyle(
                    //     text: 'Reset password?',
                    //     color: AppColors.appGreen,
                    //     fontSize: 12),
                   CommonTextButton(
                       text: 'Reset Password',
                       color: AppColors.appGreen
                   )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
