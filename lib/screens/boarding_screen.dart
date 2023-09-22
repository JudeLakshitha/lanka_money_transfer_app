import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/screens/reset_password_screen.dart';
import 'package:lanka_money_transfer_app/screens/sign_up_screen.dart';
import 'package:lanka_money_transfer_app/widgets/reusable_widgets.dart';

import 'login_screen.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/boarding_screen_image.png"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                elevatedGreenButton(
                    'Login',
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const LoginScreen()));
                    }),
                SizedBox(width: 50),
                elevatedGreenButton(
                  'Create Account',
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
