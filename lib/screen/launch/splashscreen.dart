import 'package:ecodeem/generated/assets.dart';
import 'package:ecodeem/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAnimate = false;
  final GetStorage _box = GetStorage();
  Future<void> load() async {
    final bool registerBefore = await _box.read('isOld') as bool? ?? false;
    if (registerBefore) {
      Get.offAllNamed(AppPageRoute.authLogin);
    } else {
      Get.offAllNamed(AppPageRoute.activity);
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: 100.w,
      height: 100.h,
      child: Center(
          child: Image.asset(
        Assets.brandAppLogo,
        fit: BoxFit.fitWidth,
        width: 80.sp,
      )),
    ));
  }
}
