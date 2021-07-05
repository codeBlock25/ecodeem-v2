import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/routes/page_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ActiveUser? _activeUser;
  Future<void> load() async {
    setState(() {
      _activeUser = Get.arguments['userDetails'] as ActiveUser;
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
      appBar: AppBar(
        title: Text(
          '@${_activeUser?.username ?? 'no_one'}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed(AppPageRoute.accountSettingView,
                  arguments: <String, dynamic>{
                    'userDetails': Get.arguments['userDetails']
                  });
            },
            icon: const Icon(UniconsLine.setting),
            iconSize: 20.sp,
          ),
        ],
      ),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 30.w.clamp(100, 300),
                  height: 30.w.clamp(100, 300),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 95,
                            height: 97,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xff3d3d3d),
                                width: 2,
                              ),
                            ),
                            child: FlutterLogo(size: 95),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: -5.sp,
                          right: -5.sp,
                          child: Container(
                            width: 22.sp,
                            height: 22.sp,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(40.sp),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: IconButton(
                              padding: EdgeInsets.all(1.sp),
                              icon: const Icon(
                                UniconsLine.plus,
                                color: Colors.white,
                              ),
                              iconSize: 15.sp,
                              onPressed: () {},
                            ),
                          ))
                    ],
                  ),
                ),
                buildAccHint(title: 'Post'),
                buildAccHint(title: 'Followers'),
                buildAccHint(title: 'Following'),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 25.sp).copyWith(top: 20.sp),
              child: Text(
                _activeUser?.username.capitalize ?? 'no_one',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 25.sp).copyWith(top: 5.sp),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc faucibus in lectus aliquam.',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[100]),
                          overlayColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0.1)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.sp),
                                side: BorderSide(color: Colors.grey[800]!)),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(Size(70.sp, 30.sp))),
                      child: Text(
                        'Edit Bio',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      )),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[100]),
                          overlayColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0.1)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.sp),
                                side: BorderSide(color: Colors.grey[800]!)),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(Size(70.sp, 30.sp))),
                      child: Text(
                        'Interest',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      )),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[100]),
                          overlayColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0.1)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.sp),
                                side: BorderSide(color: Colors.grey[800]!)),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(Size(100.sp, 30.sp))),
                      child: Text(
                        'Create Campaign',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      )),
                ),
                SizedBox(
                  width: 10.sp,
                ),
              ],
            ),
            Container(
              width: 100.w,
              height: 40,
              margin:
                  EdgeInsets.symmetric(horizontal: 10.sp).copyWith(top: 15.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff2f2f2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'My Posts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Saved Post',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  ),
                  Text(
                    'Campaigns',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildAccHint({required String title}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.sp),
    child: Column(
      children: <Widget>[
        Text(
          '23',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
