import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lanka_money_transfer_app/widgets/reusable_widgets.dart';
import '../utils/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _userNameValidattion = false;
  bool _passwordValidation = false;
  bool passwordVisibility = true;
  bool obscureText = true;
  Color _visibilityColor = AppColors.appGrey;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();

  //final AuthValidators authValidator = AuthValidators();
  final GlobalKey<FormState> _password = GlobalKey<FormState>();
  final GlobalKey<FormState> _confirmPassword = GlobalKey<FormState>();

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void dispose() {
    //widget.usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(const Text('')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(width: double.infinity),
              logoWidget(context, "assets/images/sign_up_screen_logo.png"),
              titleText('Login'),
              const SizedBox(height: 8.0),
              baseText('Enter the username & password to log-in',
                  FontWeight.normal, AppColors.appGrey),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Username'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: baseTextField(
                    userNameController,
                    const ImageIcon(AssetImage("assets/icons/icon_at.png")),
                    const ImageIcon(
                        AssetImage('assets/icons/validate_mark.png')),
                    TextInputType.text,
                    'Username field cannot be empty'),
              ),
              const SizedBox(height: 20),
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
                child: passwordTextField(passwordController, obscureText,
                    passwordFocusNode, toggleObscureText),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: elevatedBlueButton(
                    context,
                    'Login',
                    () {},
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Cannot remember the password ?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.appGrey,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: const Text(
                        " Reset Password",
                        style: TextStyle(
                            color: AppColors.appBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
