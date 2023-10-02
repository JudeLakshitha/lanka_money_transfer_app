import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lanka_money_transfer_app/bloc/login_bloc/login_bloc.dart';
import 'package:lanka_money_transfer_app/bloc/login_bloc/login_repository.dart';
import 'package:lanka_money_transfer_app/bloc/login_bloc/login_submission_status.dart';
import 'package:lanka_money_transfer_app/screens/reset_forget_password_screens/reset_password_screen.dart';
import 'package:lanka_money_transfer_app/widgets/reusable_widgets.dart';
import '../utils/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //bool _userNameValidattion = false;
  //bool _passwordValidation = false;
  bool passwordVisibility = true;
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  //Color _visibilityColor = AppColors.appGrey;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();

  //final AuthValidators authValidator = AuthValidators();
  // final GlobalKey<FormState> _password = GlobalKey<FormState>();
  // final GlobalKey<FormState> _confirmPassword = GlobalKey<FormState>();

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
      //backgroundColor: Colors.white,
      appBar: appBar(const Text('')),
      body: BlocProvider(
        create: (context) => LoginBloc(
          loginRepo: context.read<LoginRepository>(),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: double.infinity),
                  logoWidget(context, "assets/images/sign_up_screen_logo.png"),
                  titleText('Login'),
                  const SizedBox(height: 8.0),
                  baseText('Enter the username & password to log-in',
                      FontWeight.normal, AppColors.appGrey),
                  const SizedBox(height: 20),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      final formStatus = state.formStatus;
                      if(formStatus is SubmissionFailed){
                        _showSnackBar(context, formStatus.exception.toString());
                      }
                    },
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: textFieldTag('Username'),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return baseTextField(
                                  userNameController,
                                  const ImageIcon(
                                      AssetImage("assets/icons/icon_at.png")),
                                  const ImageIcon(AssetImage(
                                      'assets/icons/validate_mark.png')),
                                  TextInputType.text,
                                  'Username field cannot be empty',
                                  (value) => state.isValidUsername
                                      ? null
                                      : 'Invalid username',
                                  (value) => context.read<LoginBloc>().add(
                                      LoginUsernameChanged(username: value)),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: textFieldTag('Password'),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return passwordTextField(
                                  passwordController,
                                  obscureText,
                                  passwordFocusNode,
                                  toggleObscureText,
                                  (value) => state.isValidPassword
                                      ? null
                                      : 'Invalid password',
                                  (value) => context.read<LoginBloc>().add(
                                      LoginPasswordChanged(password: value)),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return state.formStatus is FormSubmitting
                                      ? CircularProgressIndicator()
                                      : elevatedBlueButton(
                                          'Login',
                                          () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read()<LoginBloc>()
                                                  .add(LoginSubmitted());
                                            } else {
                                              print(
                                                  '-------------validation not working-------------');
                                            }
                                          },
                                        );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
                                    builder: (context) =>
                                        ResetPasswordScreen()));
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
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    content: Text(msg),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
