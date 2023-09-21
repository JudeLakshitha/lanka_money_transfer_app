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
import 'package:lanka_money_transfer_app/components/commonCheckBox.dart';
import 'package:lanka_money_transfer_app/widgets/reusable_widgets.dart';

import '../components/buttons/commonDropDownButton.dart';
import '../utils/style.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool _userNameValidate = false;
  bool _passwordValidate = false;
  bool passwordVisibility = true;
  Color _visibilityColor = AppColors.appGrey;

  // void signUserIn() {
  //   setState(() {
  //     widget.usernameController.text.isEmpty
  //         ? _userNameValidate = true
  //         : _userNameValidate = false;
  //     widget.passwordController.text.isEmpty
  //         ? _passwordValidate = true
  //         : _passwordValidate = false;
  //   });
  // }

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
            children: <Widget>[
              const SizedBox(width: double.infinity),
              // Container(
              //   width: screenWidth / 2,
              //   height: screenHeight / 3.75,
              //   alignment: Alignment.center,
              //   child: Image.asset('assets/images/sign_up_screen_logo.png'),
              // ),
              logoWidget(context, "assets/images/sign_up_screen_logo.png"),
              const CommonTitleTextStyle(text: 'Sign up'),
              const SizedBox(height: 8.0),
              const CommonTextStyle(
                text: 'Enter below details to complete the sign up process',
                color: AppColors.appGrey,
                fontSize: 12,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Name'),
                ),
              ),
              const SizedBox(height: 8.0),
              CommonTextField(
                key: widget.key,
                textInputType: TextInputType.text,
                controller: widget.usernameController,
                validation: _userNameValidate,
                prefixIcon:
                    const ImageIcon(AssetImage("assets/icons/user_icon.png")),
                suffixIcon: const Icon(null),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Address'),
                ),
              ),
              const SizedBox(height: 8.0),
              CommonTextField(
                textInputType: TextInputType.text,
                controller: widget.usernameController,
                validation: _userNameValidate,
                prefixIcon: const ImageIcon(
                    AssetImage("assets/icons/location_icon.png")),
                suffixIcon: const Icon(null),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Country'),
                ),
              ),
              const SizedBox(height: 8.0),
              // CommonTextField(
              //   textInputType: TextInputType.text,
              //   controller: widget.usernameController,
              //   validation: _userNameValidate,
              //   prefixIcon:
              //       const ImageIcon(AssetImage("assets/icons/icon_at.png")),
              //   suffixIcon: Icon(null),
              // ),
              const BaseDropDownButton(),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Mobile Number'),
                ),
              ),
              const SizedBox(height: 8.0),
              // CommonTextField(
              //   textInputType: TextInputType.text,
              //   controller: widget.usernameController,
              //   validation: _userNameValidate,
              //   prefixIcon:
              //       const ImageIcon(AssetImage("assets/icons/icon_at.png")),
              //   suffixIcon: Icon(null),
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextStyle(
                      text: 'Are you a member ?',
                      color: AppColors.appGrey,
                      fontSize: 12,
                    ),
                    CommonTextButton(text: 'Login', color: AppColors.appBlue),
                    CommonTextStyle(
                      text: 'now',
                      color: AppColors.appGrey,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'NIC/Passport No'),
                ),
              ),
              const SizedBox(height: 8.0),
              CommonTextField(
                textInputType: TextInputType.text,
                controller: widget.usernameController,
                validation: _userNameValidate,
                prefixIcon:
                    const ImageIcon(AssetImage("assets/icons/icon_at.png")),
                suffixIcon: Icon(null),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'E-mail'),
                ),
              ),
              CommonTextField(
                textInputType: TextInputType.text,
                controller: widget.usernameController,
                validation: _userNameValidate,
                prefixIcon:
                    const ImageIcon(AssetImage("assets/icons/icon_at.png")),
                suffixIcon: Icon(null),
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Confirm Password'),
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
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        child: const BaseCheckbox(),
                      ),
                    ),
                    Flexible(
                      child: CommonTextStyle(
                          text: "Agree",
                          color: AppColors.appGrey,
                          fontSize: 16),
                    ),
                    SizedBox(width: 3),
                    Flexible(
                      flex: 5,
                      child: CommonTextStyleBold(
                        text: "terms and conditions",
                        color: AppColors.appGrey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              BlueButton(
                onTap: () {},
                text: 'Register',
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextStyle(
                      text: 'Are you a member ?',
                      color: AppColors.appGrey,
                      fontSize: 12,
                    ),
                    CommonTextButton(text: 'Login', color: AppColors.appBlue),
                    CommonTextStyle(
                      text: 'now',
                      color: AppColors.appGrey,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              Container(
                // width: screenWidth / 2,
                // height: screenHeight / 3.75,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                alignment: Alignment.center,
                child: Image.asset('assets/images/dfcc_bank_logo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
