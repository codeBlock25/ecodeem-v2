import 'dart:async';
import 'dart:math';

import 'package:ecodeem/generated/assets.dart';
import 'package:ecodeem/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class ActivityPickerScreen extends StatefulWidget {
  const ActivityPickerScreen({Key? key}) : super(key: key);

  @override
  _ActivityPickerState createState() => _ActivityPickerState();
}

class OnboardPageData {
  OnboardPageData(
      {required this.color,
      required this.titleText,
      required this.contentText,
      required this.image});
  final Color color;
  final String titleText;
  final String contentText;
  final String image;
}

class ItemData {
  ItemData(this.color, this.image, this.text1, this.text2, this.text3);
  final Color color;
  final String image;
  final String text1;
  final String text2;
  final String text3;
}

class _ActivityPickerState extends State<ActivityPickerScreen>
    with WidgetsBindingObserver {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;
  List<OnboardPageData> onBoardPages = <OnboardPageData>[
    OnboardPageData(
        color: Colors.red,
        titleText: 'Advocacy Stickers',
        contentText:
            'Tell an advocacy story by complimenting your photos with friends, families, and colleagues at work.',
        image: Assets.designAdvocacyStickers),
    OnboardPageData(
        color: Colors.blue,
        titleText: 'Reliable crowd funding',
        contentText:
            'Get access to fund your passion and business and view a list of interesting initiatives requiring funding.',
        image: Assets.designCrowdFund),
    OnboardPageData(
        color: Colors.orangeAccent,
        titleText: 'Simple, instant messaging',
        contentText:
            'Send your messages, for free to your friends so you can avoid sms charges.',
        image: Assets.designInstantMessage),
    OnboardPageData(
        color: Colors.greenAccent[700]!,
        titleText: 'Product Advertising',
        contentText:
            'Grown your sales by advertising your products with our marketplace.',
        image: Assets.designProductAdvertising),
    OnboardPageData(
        color: Colors.green,
        titleText: 'Reward give away',
        contentText:
            'Grow your profile status and get access to a range of exciting rewards..',
        image: Assets.designRewardGiveAway),
  ];

  bool isPaused = false;
  bool tried = false;
  Timer? _timer;
  final AppLifecycleState _appState = AppLifecycleState.resumed;
  void nextIllustration({bool delayed = false}) {
    if (_appState != AppLifecycleState.resumed ||
        _appState == AppLifecycleState.inactive) return;
    if (isPaused) {
      tried = true;
    }
    if (!mounted || isPaused) return;
    _timer?.cancel();
    if (delayed) {
      _timer = Timer(const Duration(seconds: 2), () {
        liquidController.animateToPage(
            page: page >= onBoardPages.length ? 0 : page + 1);
      });
      return;
    }
    _timer = Timer(const Duration(seconds: 5), () {
      liquidController.animateToPage(
          page: page >= onBoardPages.length ? 0 : page + 1);
    });
  }

  @override
  void initState() {
    liquidController = LiquidController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.initState();
    nextIllustration();
  }

  Widget _buildDot(int index) {
    final double selectness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - (page - index).abs(),
      ),
    );
    final double zoom = 1.0 + (2.0 - 1.0) * selectness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets _padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: GestureDetector(
        onTapDown: (TapDownDetails tapDetails) {
          setState(() {
            isPaused = true;
          });
        },
        onTapUp: (TapUpDetails tapDetails) {
          setState(() {
            isPaused = false;
          });
          nextIllustration();
        },
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: LiquidSwipe.builder(
                  itemCount: onBoardPages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100.w,
                      height: 100.h,
                      color: onBoardPages[index].color,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 100.w < 500
                                ? 100.sp.clamp(70, 120)
                                : 60.sp.clamp(50, 70),
                          ),
                          if (index == 4)
                            Image.asset(
                              onBoardPages[index].image,
                              fit: BoxFit.fitHeight,
                              height: 30.h.clamp(300, 400),
                            )
                          else
                            Image.asset(
                              onBoardPages[index].image,
                              fit: BoxFit.fitWidth,
                              width: 80.w.clamp(300, 650),
                            ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          Text(
                            onBoardPages[index].titleText.capitalize!,
                            style: TextStyle(
                                fontSize: 24.sp.clamp(28, 40),
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Text(
                              onBoardPages[index].contentText,
                              style: TextStyle(
                                  fontSize: 15.sp.clamp(20, 34),
                                  color: Colors.white70),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                        ],
                      ),
                    );
                  },
                  positionSlideIcon: 0.9,
                  slideIconWidget: const Icon(Icons.arrow_back_ios),
                  onPageChangeCallback: pageChangeCallback,
                  liquidController: liquidController,
                  ignoreUserGestureWhileAnimating: true,
                ),
              ),
              Positioned.fill(
                  child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 10.sp,
                        ),
                        SizedBox(
                          width: 40.w.clamp(100, 300),
                          height: 30.sp.clamp(40, 60),
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(AppPageRoute.interest);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20.sp, vertical: 6.sp),
                                  ),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.sp)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp.clamp(16, 22),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    UniconsLine.caret_right,
                                    size: 16.sp.clamp(24, 30),
                                    color: Colors.black,
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        SizedBox(
                          width: 40.w.clamp(100, 300),
                          height: 30.sp.clamp(40, 60),
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(AppPageRoute.authLogin);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20.sp, vertical: 6.sp),
                                  ),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.sp)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp.clamp(16, 22),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    UniconsLine.user_circle,
                                    size: 16.sp.clamp(24, 30),
                                    color: Colors.black,
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    SizedBox(
                      width: 170.sp.clamp(150, 350),
                      height: 30.sp.clamp(40, 60),
                      child: TextButton(
                          onPressed: () {
                            Get.offAllNamed(AppPageRoute.home);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 20.sp, vertical: 6.sp),
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.sp)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Shop Now',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp.clamp(16, 22),
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                UniconsLine.shop,
                                size: 16.sp.clamp(24, 30),
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List<Widget>.generate(onBoardPages.length, _buildDot),
                    ),
                    SizedBox(
                      height: _padding.bottom + 10.sp,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void pageChangeCallback(int liquidPage) {
    setState(() {
      page = liquidPage;
    });
    if (tried) {
      tried = false;
      nextIllustration(delayed: true);
    }
  }
}
