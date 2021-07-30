import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/components/components.dart';
import 'package:ecodeem/components/text_field.dart';
import 'package:ecodeem/controller/controller.dart';
import 'package:ecodeem/routes/page_route.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:ecodeem/utility/utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  bool agreeWithPolicy = true;
  final GetStorage _box = GetStorage();
  bool _hasAcceptedLicence = false;
  final InterestController _interestController = Get.put(InterestController());
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppHeaderWithBackBtn(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                width: Get.width,
                height: Get.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.sp,
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
                            'get started with your\n account today'
                                .toUpperCase(),
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
                            textController: firstName,
                            keyboardType: TextInputType.text,
                            autoComplete: const <String>[
                              AutofillHints.givenName
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter your First Name',
                              prefixIcon: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(Ionicons.person_outline,
                                    color: darkBlue),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null) {
                                return "This field can't empty";
                              } else if (value.isEmpty) {
                                return "This field can't empty";
                              }
                              return null;
                            },
                            label: 'First Name'),
                        TextFieldWidget(
                            textController: lastName,
                            keyboardType: TextInputType.text,
                            autoComplete: const <String>[
                              AutofillHints.familyName
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter your Last Name',
                            ),
                            validator: (String? value) {
                              if (value == null) {
                                return "This field can't empty";
                              } else if (value.isEmpty) {
                                return "This field can't empty";
                              }
                              return null;
                            },
                            label: 'Last Name'),
                        TextFieldWidget(
                            textController: username,
                            keyboardType: TextInputType.text,
                            autoComplete: const <String>[
                              AutofillHints.username
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter a user Name',
                            ),
                            validator: (String? value) {
                              if (value == null) {
                                return "This field can't empty";
                              } else if (value.isEmpty) {
                                return "This field can't empty";
                              }
                              return null;
                            },
                            label: 'User Name'),
                        TextFieldWidget(
                            textController: email,
                            keyboardType: TextInputType.emailAddress,
                            autoComplete: const <String>[AutofillHints.email],
                            decoration: const InputDecoration(
                              hintText: 'Enter your Email address',
                              prefixIcon: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(Ionicons.mail_outline,
                                    color: darkBlue),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null) {
                                return "This field can't empty";
                              } else if (value.isEmpty) {
                                return "This field can't empty";
                              } else if (!value.isEmail) {
                                return 'This field must be a valid email';
                              }
                              return null;
                            },
                            label: 'Email'),
                        TextFieldWidget(
                            textController: phoneNumber,
                            keyboardType: TextInputType.phone,
                            autoComplete: const <String>[
                              AutofillHints.telephoneNumber
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter your mobile number',
                              prefixIcon: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(Ionicons.call_outline,
                                    color: darkBlue),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null) {
                                return "This field can't empty";
                              } else if (value.isEmpty) {
                                return "This field can't empty";
                              } else if (!value.isPhoneNumber) {
                                return 'This field must be a valid mobile number';
                              }
                              return null;
                            },
                            label: 'Mobile Number'),
                        TextFieldWidget(
                            textController: password,
                            keyboardType: TextInputType.visiblePassword,
                            autoComplete: const <String>[
                              AutofillHints.newPassword
                            ],
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
                                        setState(() => <void>{
                                              isPasswordVisible =
                                                  !isPasswordVisible
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
                        TextFieldWidget(
                            textController: confirmPassword,
                            keyboardType: TextInputType.visiblePassword,
                            autoComplete: const <String>[
                              AutofillHints.password
                            ],
                            isHidden: true,
                            decoration: const InputDecoration(
                              hintText: 'Enter your password again',
                              prefixIcon: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(Ionicons.lock_closed_outline,
                                    color: darkBlue),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null) {
                                return "This field can't empty";
                              } else if (value.isEmpty) {
                                return "This field can't empty";
                              } else if (value != password.text) {
                                return 'Password do not match.';
                              } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                      .hasMatch(value) ||
                                  !RegExp('[1-9]').hasMatch(value)) {
                                return 'Password must contain a at least one number and special character';
                              }
                              return null;
                            },
                            label: 'Confirm Password'),
                        TextFieldWidget(
                            textController: country,
                            keyboardType: TextInputType.text,
                            autoComplete: const <String>[
                              AutofillHints.countryName
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter your country',
                              prefixIcon: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(Ionicons.globe_outline,
                                    color: darkBlue),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null) {
                                return "This field can't empty";
                              } else if (value.isEmpty) {
                                return "This field can't empty";
                              } else if (!value.isCountry) {
                                return 'Provide a valid country.';
                              }
                              return null;
                            },
                            label: 'Country'),
                        TextFieldWidget(
                            textController: state,
                            keyboardType: TextInputType.text,
                            autoComplete: const <String>[
                              AutofillHints.addressCityAndState
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter your state / city',
                              prefixIcon: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(Ionicons.location_outline,
                                    color: darkBlue),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null) {
                                return "This field can't empty";
                              } else if (value.isEmpty) {
                                return "This field can't empty";
                              }
                              return null;
                            },
                            label: 'State'),
                        SizedBox(
                          height: 20.sp,
                        ),
                        TextButton(
                            onPressed: () {
                              registerUser(
                                  formKey: _formKey,
                                  firstName: firstName,
                                  lastName: lastName,
                                  username: username,
                                  email: email,
                                  password: password,
                                  phoneNumber: phoneNumber,
                                  country: country,
                                  state: state,
                                  interestID: _interestController.interestIDs(),
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
                              'REGISTER',
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
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: const Color(0xfF393939),
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp.clamp(12, 20),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Login',
                                    style: const TextStyle(
                                      color: primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(AppPageRoute.authLogin);
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
            if (!_hasAcceptedLicence)
              LicenseTerms(updateAgreement: () async {
                await _box.write('hasAcceptedLicence', true);
                setState(() {
                  _hasAcceptedLicence = true;
                });
              })
            else
              const Positioned(width: 0, height: 0, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
