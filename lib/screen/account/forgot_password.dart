import 'dart:math';

import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/components/text_field.dart';
import 'package:ecodeem/function/auth/auth.dart';
import 'package:ecodeem/function/error.dart';
import 'package:ecodeem/logic/size.dart';
import 'package:ecodeem/routes/page_route.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final TextEditingController userDetailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double width = trueWidth(MediaQuery.of(context));
    return Scaffold(
      appBar: buildAppHeaderWithBackBtn(),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: width / 2.3,
                      height: width / 2.3,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width),
                        border: Border.all(color: Colors.white, width: 20),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width),
                            color: const Color(0xFFE6F5D5)),
                        child: Center(
                          child: Icon(
                            Ionicons.person,
                            size: width / 8,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'recover your account with ease!'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width / 18.89,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                        textController: userDetailController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Enter your registered account Email',
                          prefixIcon: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Ionicons.person_circle_outline,
                                color: darkBlue),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null) {
                            return "This field can't empty";
                          } else if (value.isEmpty) {
                            return "This field can't empty";
                          } else if (!value.isEmail) {
                            return 'Please provide a valid email.';
                          }
                          return null;
                        },
                        label: 'Email'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            requestPasswordReset(
                                    email: userDetailController.text,
                                    context: context)
                                .then((Response<dynamic> value) {
                              const SnackBar snackBar = SnackBar(
                                content: Text(
                                  'A reset password link has been sent to your email, please follow the link to reset your password.',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Get.toNamed(AppPageRoute.authLogin);
                            }).catchError((dynamic error) {
                              Get.back();
                              displayError(error, context);
                            });
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF303030)),
                            overlayColor: MaterialStateProperty.all(
                                Colors.white.withOpacity(0.1)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                                Size(min(width / 1.656, 500), 50))),
                        child: Text(
                          'Submit'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width / 29.89,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(
                  height: 50.sp.clamp(60, 100),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text:
                          'Note: An email / sms will be sent to you to within the next 15 minutes follow the link on it to recover your account.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n\n@ecodeem.',
                          style: TextStyle(
                            color: Color(0xFF8A8A8A),
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20.sp.clamp(20, 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
