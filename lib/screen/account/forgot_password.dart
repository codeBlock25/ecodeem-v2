import 'dart:math';

import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/components/text_field.dart';
import 'package:ecodeem/generated/assets.dart';
import 'package:ecodeem/logic/size.dart';
import 'package:ecodeem/routes/page_route.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final TextEditingController userDetailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double width = trueWidth(MediaQuery.of(context));
    return Scaffold(
      appBar: buildAppHeaderWithBackBtn(),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  Assets.designShopArt,
                  fit: BoxFit.fitWidth,
                  width: Get.width,
                  height: Get.height,
                )),
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  Assets.designPic1,
                  fit: BoxFit.cover,
                  width: Get.width,
                  height: Get.height,
                )),
            Container(
              width: Get.width,
              height: Get.height,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
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
                            'get connected with ease!'.toUpperCase(),
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
                              hintText: 'Enter your Full Name',
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
                              } else if (value.length < 4) {
                                return 'This field must be more than 4 characters long';
                              } else if (value.trim().split(' ').length < 2) {
                                return 'This field must contain your first name and last name';
                              }
                              return null;
                            },
                            label: 'Username / Email / Phone number'),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              debugPrint('shop online was clicked');
                              Get.offAllNamed(AppPageRoute.home);
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
                              'FORGOT PASSWORD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width / 29.89,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
