import 'package:flutter/material.dart';
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
            //logoWidget(context, "assets/images/boarding_screen_image.png"),
            Image.asset(
              "assets/images/boarding_screen_image.png",
              fit: BoxFit.fitWidth,
              width: 400,
              height: 500,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                elevatedGreenButton('Login', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
                const SizedBox(width: 50),
                elevatedGreenButton(
                  'Create Account',
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SignUpScreen()));
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
