import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/components/text_field.dart';
import 'package:ecodeem/controller/controller.dart';
import 'package:ecodeem/generated/assets.dart';
import 'package:ecodeem/routes/page_route.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userDetailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool canCheckBiometrics = false;
  final GetStorage _box = GetStorage();
  List<BiometricType>? availableBiometrics = <BiometricType>[];
  Future<void> authenticateWithBio() async {
    final bool didAuthenticate = await _localAuthentication.authenticate(
        localizedReason: 'Please authenticate to access your account.',
        biometricOnly: true);
    final Map<String, dynamic>? _rawDetail =
        await _box.read('user') as Map<String, dynamic>?;
    final bool canVibrate = await Vibrate.canVibrate;
    if (_rawDetail == null) {
      if (canVibrate) {
        if (GetPlatform.isAndroid) {
          final Iterable<Duration> pauses = <Duration>[
            const Duration(milliseconds: 500),
            const Duration(milliseconds: 1000),
            const Duration(milliseconds: 500),
          ];
          Vibrate.vibrateWithPauses(pauses);
          Vibrate.vibrate();
        } else {
          Vibrate.feedback(FeedbackType.warning);
          Vibrate.vibrate();
        }
      }
      const SnackBar snackBar = SnackBar(
        content: Text(
          'You have to Login at least once to use bio-metric auth',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        duration: Duration(seconds: 8),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    final UserLoginDetails _userLoginDetails =
        UserLoginDetails.fromJson(_rawDetail);
    if (didAuthenticate) {
      if (canVibrate) {
        if (GetPlatform.isAndroid) {
          final Iterable<Duration> _pauses = <Duration>[
            const Duration(milliseconds: 500),
            const Duration(milliseconds: 1000),
            const Duration(milliseconds: 2000),
            const Duration(milliseconds: 500),
          ];
          Vibrate.vibrateWithPauses(_pauses);
          Vibrate.vibrate();
        } else {
          Vibrate.feedback(FeedbackType.success);
          Vibrate.vibrate();
        }
      }
      userDetailController.text = _userLoginDetails.email;
      passwordController.text = _userLoginDetails.password;
      loginUser(
          formKey: _formKey,
          email: userDetailController,
          password: passwordController,
          context: context);
    }
  }

  Future<void> loadAuth() async {
    final bool _isDeviceSupport =
        await _localAuthentication.isDeviceSupported();
    if (!_isDeviceSupport) {
      return;
    }
    final bool _canCheckBiometrics =
        await _localAuthentication.canCheckBiometrics;
    final List<BiometricType> _availableBiometrics =
        await _localAuthentication.getAvailableBiometrics();
    setState(() {
      availableBiometrics = _availableBiometrics;
      canCheckBiometrics = _canCheckBiometrics;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAuth();
  }

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppHeaderWithBackBtn(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: (100.w / 2.3).clamp(150, 220),
                    height: (100.w / 2.3).clamp(150, 220),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.w),
                      border: Border.all(color: Colors.white, width: 20),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.w),
                          color: const Color(0xFFE6F5D5)),
                      child: Center(
                        child: Icon(
                          Ionicons.person,
                          size: 30.sp.clamp(50, 100),
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'welcome back!'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp.clamp(20, 30),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldWidget(
                      textController: userDetailController,
                      keyboardType: TextInputType.emailAddress,
                      autoComplete: const <String>[AutofillHints.email],
                      decoration: InputDecoration(
                        hintText: 'Enter your Account Email',
                        prefixIcon: SizedBox(
                          width: 25.sp,
                          height: 25.sp,
                          child: const Icon(Ionicons.person_circle_outline,
                              color: darkBlue),
                        ),
                        suffixIcon: canCheckBiometrics
                            ? GestureDetector(
                                onTap: () => <void>{authenticateWithBio()},
                                child: Container(
                                  padding: EdgeInsets.all(5.sp),
                                  margin: EdgeInsets.all(3.sp)
                                      .copyWith(right: 5.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          5.sp.clamp(2, 5)),
                                      color: Colors.grey[200]),
                                  child: GetPlatform.isIOS
                                      ? Image.asset(
                                          Assets.iconsFaceId,
                                          width: 16.sp.clamp(14, 20),
                                          fit: BoxFit.fitWidth,
                                        )
                                      : Icon(
                                          Ionicons.finger_print,
                                          size: 14.sp,
                                        ),
                                ))
                            : const SizedBox(),
                      ),
                      validator: (String? value) {
                        if (value == null) {
                          return "This field can't empty";
                        } else if (value.isEmpty) {
                          return "This field can't empty";
                        } else if (value.length < 4) {
                          return 'This field must be more than 4 characters long';
                        } else if (!value.isEmail) {
                          return 'Invalid email address.';
                        }
                        return null;
                      },
                      label: 'Email'),
                  TextFieldWidget(
                      textController: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      autoComplete: const <String>[AutofillHints.password],
                      isHidden: !isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter a strong password',
                        prefixIcon: const SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(Ionicons.lock_closed_outline,
                              color: darkBlue),
                        ),
                        suffix: GestureDetector(
                            onTap: () => <void>{
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  })
                                },
                            child: Icon(!isPasswordVisible
                                ? UniconsLine.eye
                                : UniconsLine.eye_slash)),
                      ),
                      validator: (String? value) {
                        if (value == null) {
                          return "This field can't empty";
                        } else if (value.isEmpty) {
                          return "This field can't empty";
                        } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                .hasMatch(value) ||
                            !RegExp('[1-9]').hasMatch(value)) {
                          return 'Password must contain a at least one number and special character';
                        }
                        return null;
                      },
                      label: 'Password'),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Forgot your password? ',
                        style: TextStyle(
                          color: const Color(0xfF393939),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp.clamp(12, 20),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Click here',
                              style: const TextStyle(
                                color: primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(AppPageRoute.authForgotPassword);
                                })
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        loginUser(
                            formKey: _formKey,
                            email: userDetailController,
                            password: passwordController,
                            context: context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          overlayColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0.1)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(
                            60.w.clamp(200, 350),
                            40.sp.clamp(50, 80),
                          ))),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp.clamp(14, 24),
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: const Color(0xfF393939),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp.clamp(12, 20),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Register',
                              style: const TextStyle(
                                color: primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(AppPageRoute.interest);
                                })
                        ]),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
