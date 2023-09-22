import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/screens/reset_password_screen.dart';
import '../utils/style.dart';
import '../widgets/reusable_widgets.dart';
import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  bool _userNameValidate = false;
  bool _passwordValidate = false;
  bool passwordVisibility = true;
  Color _visibilityColor = AppColors.appGrey;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    //widget.usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              logoWidget(context, "assets/images/otp_screen_logo.png"),
              titleText('Enter OTP'),
              const SizedBox(height: 8.0),
              baseText('Enter the OTP sent to your mobile number',
                  FontWeight.normal, AppColors.appGrey),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  height: 50,
                  child: otpTextField(),
                ),
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
                      'Login',
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordScreen()));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Flexible(
                      flex:1,
                      child: Text(
                        "Did not received OTP ?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.appGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          " Resend again",
                          style: TextStyle(
                              color: AppColors.appGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
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

NavigateToLogin() {
  MaterialPageRoute(builder: (context) => LoginScreen());
}
