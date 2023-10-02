import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lanka_money_transfer_app/screens/login_screen.dart';
import 'package:lanka_money_transfer_app/widgets/reusable_widgets.dart';
import '../utils/style.dart';
import 'otp_screen.dart';

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

class SignUpScreen extends StatefulWidget {
  final _nameGlobalKey = GlobalKey();
  final _addressGlobalKey = GlobalKey();
  final _phoneGlobalKey = GlobalKey();
  final _nicGlobalKey = GlobalKey();
  final _emailGlobalKey = GlobalKey();
  final _passwordGlobalKey = GlobalKey();
  final _confirmPasswordGlobalKey = GlobalKey();

  SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  // bool _nameValidattion = false;
  // bool _addressValidation = false;
  // bool _mobileNoValidation = false;
  // bool _nicPassportValidation = false;
  // bool _emailValidation = false;
  // bool _passwordValidation = false;
  // bool _confirmPasswordValidation = false;
  bool passwordVisibility = true;
  bool obscureText = true;
  bool confirmObscureText = true;

  //Color _visibilityColor = AppColors.appGrey;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController nicPassportController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  //final AuthValidators authValidator = AuthValidators();
  // final GlobalKey<FormState> _password = GlobalKey<FormState>();
  // final GlobalKey<FormState> _confirmPassword = GlobalKey<FormState>();

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(width: double.infinity),
              logoWidget(context, "assets/images/sign_up_screen_logo.png"),
              titleText('Sign up'),
              const SizedBox(height: 8.0),
              baseText('Enter below details to complete the sign up process',
                  FontWeight.normal, AppColors.appGrey),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Name'),
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
                  'Name field cannot be empty',
                  (value) {
                    print(value);
                  },
                  (value) {
                    print(value);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Address'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: baseTextField(
                  addressController,
                  const ImageIcon(AssetImage("assets/icons/location_icon.png")),
                  const ImageIcon(null),
                  TextInputType.text,
                  'Address field cannot be empty',
                  (value) {
                    print(value);
                  },
                  (value) {
                    print(value);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Country'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: dropdownFormField(
                      countryList,
                      const ImageIcon(
                          AssetImage("assets/icons/arrow_back_icon.png")),
                    )),
              ),
              //const BaseDropDownButton(),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Mobile Number'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 3,
                        child: dropdownButtonFormField(
                            countryCodeList,
                            const ImageIcon(
                                AssetImage("assets/icons/arrow_back_icon.png")),
                            const ImageIcon(null))),
                    SizedBox(width: 5),
                    Flexible(
                        flex: 4,
                        child: basePrefixFreeTextField(
                            mobileNoController,
                            //const ImageIcon(null),
                            const ImageIcon(
                                AssetImage('assets/icons/validate_mark.png')),
                            TextInputType.number,
                            'Number cannot be empty')),
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
                  const ImageIcon(AssetImage('assets/icons/validate_mark.png')),
                  TextInputType.text,
                  'NIC/Passport field cannot be empty',
                  (value) {
                    print(value);
                  },
                  (value) {
                    print(value);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('E-mail'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: baseTextField(
                  emailController,
                  const ImageIcon(AssetImage("assets/icons/icon_at.png")),
                  const ImageIcon(AssetImage('assets/icons/validate_mark.png')),
                  TextInputType.emailAddress,
                  'Email field cannot be empty',
                  (value) {
                    print(value);
                  },
                  (value) {
                    print(value);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Password'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: passwordTextField(
                  passwordController,
                  obscureText,
                  confirmPasswordFocusNode,
                  toggleObscureText,
                  (value) {},
                  (value) {},
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: textFieldTag('Confirm Password'),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: passwordTextField(
                  confirmPasswordController,
                  confirmObscureText,
                  passwordFocusNode,
                  toggleConfirmObscureText,
                  (value) {},
                  (value) {},
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Flexible(
                      child: baseCheckBox(true),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Text(
                        "Agree",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.appGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: "Pressed Terms & conditions",
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        },
                        child: const Text(
                          " terms and conditions",
                          style: TextStyle(
                              color: AppColors.appGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: elevatedBlueButton(
                    'Register',
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen()));
                    },
                  ),
                ),
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
                        "Are you a member ?",
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
                          " Login",
                          style: TextStyle(
                              color: AppColors.appBlue,
                              fontSize: 12,
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
                          fontSize: 12,
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
