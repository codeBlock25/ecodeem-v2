import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/components/components.dart';
import 'package:ecodeem/controller/controller.dart';
import 'package:ecodeem/generated/assets.dart';
import 'package:ecodeem/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class AccountHome extends StatefulWidget {
  const AccountHome({Key? key}) : super(key: key);

  @override
  _AccountHomeState createState() => _AccountHomeState();
}

class _AccountHomeState extends State<AccountHome> {
  CurrentUser? _activeUser;
  // final GetStorage _box = GetStorage();
  Future<void> load() async {
    setState(() {
      _activeUser = Get.arguments['userDetails'] as CurrentUser;
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGeneralAppBar(
          '${_activeUser?.firstName ?? 'No'} ${_activeUser?.lastName ?? 'One'}'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: Get.width / 3,
                height: Get.width / 3,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 111,
                          height: 111,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage(Assets.brandAvatar)),
                            border: Border.all(
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xff619f1c),
                                    width: 2,
                                  ),
                                  color: const Color(0xff1d201a),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  child: IconButton(
                                    onPressed: () {},
                                    iconSize: 22,
                                    icon: const Icon(UniconsLine.camera,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 21),
                      Text(
                        _activeUser?.username.capitalize ?? 'user',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListItemView(
              icon: UniconsLine.mobile_android,
              title: 'General',
              func: () {
                Get.toNamed(AppPageRoute.accountGeneralView);
              },
            ),
            ListItemView(
              icon: UniconsSolid.user_md,
              title: 'Account Setting',
              func: () {},
            ),
            ListItemView(
              icon: UniconsLine.card_atm,
              title: 'My Cards',
              func: () {},
            ),
            ListItemView(
              icon: UniconsLine.history,
              title: 'Order History',
              func: () {},
            ),
            ListItemView(
              icon: UniconsLine.language,
              title: 'Go to site',
              func: () {},
            ),
            ListItemView(
              icon: UniconsLine.exclamation_circle,
              title: 'About Us',
              func: () {},
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
