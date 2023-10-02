import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/screens/boarding_screen.dart';
import 'package:lanka_money_transfer_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const BoardingScreen())));

    // var assetsImage = new AssetImage(
    //     'images/new_logo.png'); //<- Creates an object that fetches an image.
    // var image = new Image(
    //     image: assetsImage,
    //     height:300); //<- Creates a widget that displays an image.

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
            child: Text('Lanka Money Transfer'),
          ),
        ), //<- place where the image appears
      ),
      debugShowCheckedModeBanner: false
    );
  }
}
