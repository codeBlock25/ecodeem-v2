import 'package:ecodeem/screen/account_home/account_home.dart';
import 'package:ecodeem/screen/home/chathome.dart';
import 'package:ecodeem/screen/home/post/post.dart';
import 'package:ecodeem/screen/home/social/social.dart';
import 'package:ecodeem/screen/marketplace/marketplace.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:unicons/unicons.dart';

class AppHomeBuilder extends StatefulWidget {
  const AppHomeBuilder({Key? key}) : super(key: key);

  @override
  _AppHomeBuilderState createState() => _AppHomeBuilderState();
}

class _AppHomeBuilderState extends State<AppHomeBuilder> {
  int currentPage = 0;
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<StatefulWidget> _buildScreens() {
    return <StatefulWidget>[
      const SocialHome(),
      const MarketPlaceHome(),
      PostScreen(
        controller: _controller,
      ),
      const ChatHome(),
      const AccountScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return <PersistentBottomNavBarItem>[
      PersistentBottomNavBarItem(
        icon: const Icon(UniconsLine.estate),
        title: 'Home',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(UniconsLine.shop),
        title: 'Market',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.add_circle,
          color: primaryColor,
        ),
        title: 'Post',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(UniconsLine.comment_lines),
        title: 'Messages',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(UniconsLine.user),
        title: 'Account',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
