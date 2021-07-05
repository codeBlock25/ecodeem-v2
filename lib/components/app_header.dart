import 'package:ecodeem/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

AppBar buildAppHeaderWithBackBtn() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Image.asset(
      Assets.brandAppLogoText,
      fit: BoxFit.fitHeight,
      height: 20.sp,
    ),
    centerTitle: true,
  );
}

AppBar buildAppHeaderWithBackBtnAndText(String text) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      text,
      style: TextStyle(
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Ionicons.chevron_back),
      onPressed: () => Get.back(),
    ),
  );
}

AppBar buildSocialAppBar() {
  return AppBar(
      centerTitle: false,
      title: Image.asset(
        Assets.brandAppLogo,
        fit: BoxFit.fitWidth,
        width: 28.sp,
      ),
      actions: <Widget>[
        Container(
            width: 30.sp,
            margin: EdgeInsets.symmetric(vertical: 5.sp).copyWith(right: 5.sp),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: IconButton(
                icon: const Icon(UniconsLine.search),
                color: Colors.white,
                onPressed: () {})),
        Container(
            width: 30.sp,
            margin: EdgeInsets.symmetric(vertical: 5.sp).copyWith(right: 5.sp),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: IconButton(
                icon: const Icon(UniconsLine.bell),
                color: Colors.white,
                onPressed: () {})),
        SizedBox(
          width: 5.sp,
        ),
      ]);
}

AppBar buildMarketPlaceAppBar() {
  return AppBar(
    centerTitle: false,
    title: Image.asset(
      Assets.brandAppLogo,
      fit: BoxFit.fitWidth,
      width: 28.sp,
    ),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5.sp).copyWith(right: 2.sp),
        child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(40, 40)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: const Icon(
              Ionicons.cart,
              color: Colors.white,
              size: 20,
            )),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(40, 40)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: const Icon(
              Ionicons.notifications,
              color: Colors.white,
              size: 20,
            )),
      ),
      SizedBox(
        width: 10.sp,
      ),
    ],
  );
}

AppBar buildGeneralAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(40, 40)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: const Icon(
              Ionicons.cart,
              color: Colors.white,
              size: 20,
            )),
      )
    ],
    leading: Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(40, 40)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: const Icon(
            Ionicons.notifications,
            color: Colors.white,
            size: 20,
          )),
    ),
  );
}

AppBar buildChatAppBar({String title = 'kkk'}) {
  return AppBar(
    centerTitle: false,
    title: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: const <Widget>[
        Text(
          'John Deo',
          style: TextStyle(
            color: Color(0xff5d5d5d),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '@johnnydeo21',
          style: TextStyle(
            color: Color(0xff9dac8c),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(40, 40)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
            ),
            child: const Icon(
              UniconsLine.ellipsis_v,
              color: Colors.black,
              size: 20,
            )),
      )
    ],
    leading: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(Assets.brandAvatar), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(50)),
        )),
  );
}
