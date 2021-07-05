import 'dart:async';

import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/components/category_btn.dart';
import 'package:ecodeem/components/indicator.dart';
import 'package:ecodeem/generated/assets.dart';
import 'package:ecodeem/logic/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:unicons/unicons.dart';

class MarketPlaceHome extends StatefulWidget {
  const MarketPlaceHome({Key? key}) : super(key: key);

  @override
  _MarketPlaceHomeState createState() => _MarketPlaceHomeState();
}

class _MarketPlaceHomeState extends State<MarketPlaceHome>
    with WidgetsBindingObserver {
  bool isMarketInView = true;
  final TextEditingController searchController = TextEditingController();
  int currentPage = 0;
  final PageController _pageController = PageController();
  Timer? _timer;
  AppLifecycleState _appState = AppLifecycleState.resumed;
  void nextIllustration() {
    if (_appState != AppLifecycleState.resumed ||
        _appState == AppLifecycleState.inactive) return;
    if (!mounted) return;
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 5), () {
      _pageController.animateToPage(currentPage >= 2 ? 0 : currentPage + 1,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 500));
    });
  }

  @override
  void initState() {
    super.initState();
    nextIllustration();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    super.didChangeAppLifecycleState(appState);
    _appState = appState;
  }

  @override
  Widget build(BuildContext context) {
    final double width = trueWidth(MediaQuery.of(context));
    return Scaffold(
      appBar: buildMarketPlaceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: Get.width - 20,
                height: 45,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0x334f7b1e),
                      blurRadius: 30,
                    ),
                  ],
                  color: const Color(0xfff4ffe8),
                ),
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                      left: !isMarketInView ? (Get.width - 30) / 2 : 0,
                      top: 0,
                      child: Container(
                        width: (Get.width - 30) / 2,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff0f0f0f),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMarketInView = true;
                            });
                          },
                          child: SizedBox(
                            width: (Get.width - 20) / 2,
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  UniconsLine.shop,
                                  color: isMarketInView
                                      ? Colors.white
                                      : const Color(0xff818181),
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Shops',
                                  style: TextStyle(
                                    color: isMarketInView
                                        ? const Color(0xff8cc64b)
                                        : const Color(0xff818181),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMarketInView = false;
                            });
                          },
                          child: SizedBox(
                            width: (Get.width - 20) / 2,
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(UniconsLine.presentation_line,
                                    color: !isMarketInView
                                        ? Colors.white
                                        : const Color(0xff818181),
                                    size: 20),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Campaigns',
                                  style: TextStyle(
                                    color: !isMarketInView
                                        ? const Color(0xff8cc64b)
                                        : const Color(0xff818181),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText:
                          'Search by category, item name, seller, and so on',
                      hintStyle: TextStyle(fontSize: 12),
                      suffixIcon: Icon(UniconsLine.search_alt),
                      fillColor: Color(0xffF4F4F4)),
                ),
              ),
            ),
            LimitedBox(
              maxWidth: Get.width - 20,
              maxHeight: Get.width / 1.8,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: Get.width - 20,
                    height: Get.width / 2,
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        nextIllustration();
                        setState(() {
                          currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Container(
                          width: Get.width - 20,
                          height: Get.width / 2,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: const DecorationImage(
                                  image: AssetImage(Assets.designBg1),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: Get.width - 20,
                          height: Get.width / 2,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: const DecorationImage(
                                  image: AssetImage(Assets.designBg1),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: Get.width - 20,
                          height: Get.width / 2,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: const DecorationImage(
                                  image: AssetImage(Assets.designBg1),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    child: SizedBox(
                      width: width - 2,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          PageIndicator(isActive: currentPage == 0),
                          PageIndicator(isActive: currentPage == 1),
                          PageIndicator(isActive: currentPage == 2),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const <CategoryBtn>[
                CategoryBtn(
                  icon: Ionicons.shirt,
                  title: 'Clothes',
                ),
                CategoryBtn(
                  icon: Ionicons.shirt,
                  title: 'Clothes',
                ),
                CategoryBtn(
                  icon: Ionicons.shirt,
                  title: 'Clothes',
                ),
                CategoryBtn(
                  icon: Ionicons.shirt,
                  title: 'Clothes',
                ),
                CategoryBtn(
                  icon: Ionicons.shirt,
                  title: 'Clothes',
                ),
                CategoryBtn(
                  icon: Ionicons.shirt,
                  title: 'Clothes',
                ),
                CategoryBtn(
                  icon: Ionicons.shirt,
                  title: 'Clothes',
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Luxury Sales',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.spaceBetween,
              children: const <ProductView>[
                ProductView(),
                ProductView(),
              ],
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Get.width / 2) - 20,
      padding: const EdgeInsets.only(
        left: 15,
        top: 100,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: (Get.width / 2) - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff3f3f3),
                ),
                padding: const EdgeInsets.only(
                    top: 18, bottom: 8, left: 10, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Brown Leather shoe - x/xl/xxl/xxl',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '₦100,000',
                      style: TextStyle(
                        color: Color(0xff619f1c),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
