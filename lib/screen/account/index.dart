import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/components/inner_shadow.dart';
import 'package:ecodeem/generated/assets.dart';
import 'package:ecodeem/logic/size.dart';
import 'package:ecodeem/routes/page_route.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final double width = trueWidth(MediaQuery.of(context));
    return Scaffold(
      appBar: buildAppHeaderWithBackBtn(),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: -(Get.height - (Get.height / 1.9)),
            left: Get.width / 2 - width,
            child: InnerShadow(
              shadows: <Shadow>[
                Shadow(
                    color: const Color(0xFFD8D8D8).withOpacity(0.55),
                    blurRadius: 54,
                    offset: const Offset(0, -36))
              ],
              child: LimitedBox(
                  maxWidth: width * 2,
                  maxHeight: width * 2,
                  child: Container(
                    width: width * 2,
                    height: width * 2,
                    clipBehavior: Clip.hardEdge,
                    constraints: BoxConstraints(
                        minWidth: width * 2, minHeight: width * 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width),
                        color: Colors.white),
                    child: Stack(
                      children: <Positioned>[
                        Positioned(
                          top: Get.height - (Get.height / 2.2),
                          left: Get.width / 2,
                          child: Image.asset(
                            Assets.designShopping1,
                            width: Get.width,
                            height: Get.width,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'get started with your account today as you buy premium products with fast delivery'
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: width / 18.88,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size(width / 2 - 20, 50)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {
                        Get.toNamed(AppPageRoute.authRegister);
                      },
                      child: const Text(
                        'SIGNUP',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )),
                  TextButton(
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size(width / 2 - 20, 50)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(black),
                      ),
                      onPressed: () {
                        Get.toNamed(AppPageRoute.authLogin);
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
