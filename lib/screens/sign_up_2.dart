import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lanka_money_transfer_app/components/CommonTitleTextStyle.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonBlueButton.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonGreenButton.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonTextButton.dart';
import 'package:lanka_money_transfer_app/components/buttons/commonWhiteButton.dart';
import 'package:lanka_money_transfer_app/components/commonAppBar.dart';
import 'package:lanka_money_transfer_app/components/commonTextField.dart';
import 'package:lanka_money_transfer_app/components/commonTextFieldTag.dart';
import 'package:lanka_money_transfer_app/components/commonTextStyle.dart';
import 'package:lanka_money_transfer_app/components/passwordTextField.dart';
import 'package:lanka_money_transfer_app/components/commonCheckBox.dart';
import 'package:lanka_money_transfer_app/screens/login_screen.dart';
import 'package:lanka_money_transfer_app/widgets/reusable_widgets.dart';

import '../components/auth_validators.dart';
import '../components/buttons/commonDropDownButton.dart';
import '../components/formWidget.dart';
import '../utils/style.dart';

const List<String> countryList = <String>[
  'Select Country',
  'Sri Lanka',
  'Germany',
  'Ireland',
  'Canada',
  'United State of America',
  'United Kingdom'
];

const List<String> countryCodeList = <String>[
  '+93',
  '+355',
  '+213',
  '+1684',
  '+376',
  '+244',
  '+1264',
  '+1268',
  '+54',
  '+374',
  '+61',
  '+94',
];

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen2> {
  bool _nameValidattion = false;
  bool _addressValidation = false;
  bool _mobileNoValidation = false;
  bool _nicPassportValidation = false;
  bool _emailValidation = false;
  bool _passwordValidation = false;
  bool _confirmPasswordValidation = false;
  bool passwordVisibility = true;
  bool obscureText = true;
  bool confirmObscureText = true;
  Color _visibilityColor = AppColors.appGrey;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController nicPassportController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  final AuthValidators authValidator = AuthValidators();
  final GlobalKey<FormState> _password = GlobalKey<FormState>();
  final GlobalKey<FormState> _confirmPassword = GlobalKey<FormState>();

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void toggleConfirmObscureText() {
    setState(() {
      confirmObscureText = !confirmObscureText;
    });
  }

  // void signUserIn() {
  //   setState(() {
  //     nameController.text.isEmpty
  //         ? _nameValidattion = true
  //         : _nameValidattion = false;
  //     passwordController.text.isEmpty
  //         ? _passwordValidation = true
  //         : _passwordValidation = false;
  //   });
  // }

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
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: const Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(width: double.infinity),
              logoWidget(context, "assets/images/sign_up_screen_logo.png"),
              const CommonTitleTextStyle(text: 'Sign up'),
              const SizedBox(height: 8.0),
              const CommonTextStyle(
                text: 'Enter below details to complete the sign up process',
                color: AppColors.appGrey,
                fontSize: 12,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Name'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: baseTextField(
                    nameController,
                    const ImageIcon(AssetImage("assets/icons/user_icon.png")),
                    const ImageIcon(null),
                    TextInputType.text,
                    'Name field cannot be empty'),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Address'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: baseTextField(
                    addressController,
                    const ImageIcon(
                        AssetImage("assets/icons/location_icon.png")),
                    const ImageIcon(null),
                    TextInputType.text,
                    'Address field cannot be empty'),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Country'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: dropdownButtonFormField(
                      countryList,
                      ImageIcon(null),
                      ImageIcon(AssetImage("assets/icons/arrow_back_icon.png")),
                    )),
              ),
              //const BaseDropDownButton(),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Mobile Number'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: dropdownButtonFormField(
                            countryCodeList,
                            ImageIcon(
                                AssetImage("assets/icons/arrow_back_icon.png")),
                            ImageIcon(null))),
                    const Spacer(),
                    Expanded(
                        flex: 3,
                        child: baseTextField(
                            mobileNoController,
                            ImageIcon(null),
                            ImageIcon(
                                AssetImage('assets/icons/validate_mark.png')),
                            TextInputType.number,
                            'Number cannot be empty')),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'NIC/Passport No'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: baseTextField(
                    nicPassportController,
                    ImageIcon(null),
                    ImageIcon(AssetImage('assets/icons/validate_mark.png')),
                    TextInputType.text,
                    'NIC/Passport field cannot be empty'),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'E-mail'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: baseTextField(
                    emailController,
                    const ImageIcon(AssetImage("assets/icons/icon_at.png")),
                    ImageIcon(AssetImage('assets/icons/validate_mark.png')),
                    TextInputType.emailAddress,
                    'Email field cannot be empty'),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Password'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: passwordTextField(passwordController, obscureText,
                    confirmPasswordFocusNode, toggleObscureText),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFieldTag(text: 'Confirm Password'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: passwordTextField(
                    confirmPasswordController,
                    confirmObscureText,
                    passwordFocusNode,
                    toggleConfirmObscureText),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Flexible(
                      child: BaseCheckbox(),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Text(
                        "Agree",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.appGrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          " terms and conditions",
                          style: TextStyle(
                              color: AppColors.appGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              BlueButton(
                onTap: () {},
                text: 'Register',
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      flex: 2,
                      child: Text(
                        "Are you a member?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.appGrey,
                          fontSize: 16,
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
                          " Login",
                          style: TextStyle(
                              color: AppColors.appBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Text(
                        " now",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.appGrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Image.asset('assets/images/dfcc_bank_logo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
