import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonBlueButton.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonGreenButton.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GreenButton(
                  onTap: (){},
                  text: 'Login'
              ),
              SizedBox(height: 10,),
              BlueButton(
                  onTap: (){},
                text: 'Create Account',
              )
            ],
          ),
        ),
      ),
    );
  }
}
