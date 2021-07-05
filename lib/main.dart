import 'package:ecodeem/routes/routes.dart';
import 'package:ecodeem/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const Ecodeem());
}

class Ecodeem extends StatelessWidget {
  const Ecodeem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          GetMaterialApp(
        title: 'Ecodeem - Mobile',
        debugShowCheckedModeBanner: false,
        defaultTransition: GetPlatform.isAndroid
            ? Transition.downToUp
            : Transition.rightToLeft,
        getPages: AppPageRoute.pages,
        initialRoute: AppPageRoute.init,
        theme: AppTheme.theme,
        locale: const Locale('en'),
      ),
    );
  }
}
