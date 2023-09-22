import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lanka_money_transfer_app/screens/boarding_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(const MyApp());
  });
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      //home: LoginScreen(),
      //home: const SignUpScreen(),
      //home: const ResetPasswordScreen(),
      //home:  OtpScreen(),
      home: const BoardingScreen(),
    );
  }
}
