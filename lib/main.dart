import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanka_money_transfer_app/bloc/login_bloc/login_repository.dart';
import 'package:lanka_money_transfer_app/screens/boarding_screen.dart';
import 'package:lanka_money_transfer_app/screens/login_screen.dart';
import 'package:lanka_money_transfer_app/screens/splash_screen.dart';
import 'package:lanka_money_transfer_app/utils/style.dart';


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
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: AppColors.darkColorScheme,
      ),
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: RepositoryProvider(
        create: (context) => LoginRepository(),
        child: LoginScreen(),
      ),
    );
  }
}
