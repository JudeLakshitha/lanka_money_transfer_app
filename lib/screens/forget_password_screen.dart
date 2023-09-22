import 'package:flutter/material.dart';
import '../utils/style.dart';
import '../widgets/reusable_widgets.dart';
import 'login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool _userNameValidate = false;
  bool _passwordValidate = false;
  bool passwordVisibility = true;
  Color _visibilityColor = AppColors.appGrey;

  TextEditingController nicPassportController = TextEditingController();

  @override
  void dispose() {
    nicPassportController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(width: double.infinity),
              logoWidget(context, "assets/images/forgot_password_logo.png"),
              titleText('Enter OTP'),
              const SizedBox(height: 8.0),
              baseText('Enter your NIC/Passport number to reset your Password',
                  FontWeight.normal, AppColors.appGrey),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('NIC/Passport No'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: baseTextField(
                    nicPassportController,
                    const ImageIcon(AssetImage('assets/icons/id_icon.png')),
                    const ImageIcon(
                        AssetImage('assets/icons/validate_mark.png')),
                    TextInputType.text,
                    'NIC/Passport field cannot be empty'),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: elevatedBlueButton(
                      context,
                      'Submit',
                      NavigateTo
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

NavigateTo() {
  MaterialPageRoute(builder: (context) => LoginScreen());
}
