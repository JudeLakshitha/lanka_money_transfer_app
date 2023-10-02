import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lanka_money_transfer_app/widgets/reusable_widgets.dart';
import '../../utils/style.dart';

class ResetPasswordScreen extends StatefulWidget {
  final _resetPasswordGlobalKey = GlobalKey();
  final _resetConfirmPasswordGlobalKey = GlobalKey();

  ResetPasswordScreen({super.key});

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  //bool _passwordValidation = false;
  //bool _confirmPasswordValidation = false;
  bool passwordVisibility = true;
  bool obscureText = true;
  bool confirmObscureText = true;

  //Color _visibilityColor = AppColors.appGrey;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  //final AuthValidators authValidator = AuthValidators();
  // final GlobalKey<FormState> _password = GlobalKey<FormState>();
  // final GlobalKey<FormState> _confirmPassword = GlobalKey<FormState>();

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void toggleConfirmObscureText() {
    setState(() {
      confirmObscureText = !confirmObscureText;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: appBar(
        const Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(width: double.infinity),
              logoWidget(
                  context, "assets/images/reset_password_screen_logo.png"),
              titleText('Reset Password'),
              const SizedBox(height: 8.0),
              baseText('Enter a new password to reset the password ',
                  FontWeight.normal, AppColors.appGrey),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Password'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: passwordTextField(
                  passwordController,
                  obscureText,
                  confirmPasswordFocusNode,
                  toggleObscureText,
                  (value) {
                    print(value);
                  },
                  (value) {
                    print(value);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Confirm Password'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: passwordTextField(
                  confirmPasswordController,
                  confirmObscureText,
                  passwordFocusNode,
                  toggleConfirmObscureText,
                  (value) {
                    print(value);
                  },
                  (value) {
                    print(value);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: elevatedBlueButton( 'Submit', navigateTo),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void navigateTo() {
  Fluttertoast.showToast(
      msg: "Pressed Submit Button",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.blue,
      fontSize: 16.0);
}
