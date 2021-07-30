import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/api/user_profile.dart';
import 'package:ecodeem/components/components.dart';
import 'package:ecodeem/routes/page_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

enum AccountTabs { myPost, savedPost, campaign }

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  CurrentUser? _activeUser;
  late Future<Map<String, dynamic>?> profileDetails;
  late Map<String, dynamic>? cachedProfileDetails;
  final GetStorage _box = GetStorage();
  AccountTabs currentTab = AccountTabs.myPost;
  Future<void> load() async {
    setState(() {
      cachedProfileDetails =
          _box.read('profileDetails') as Map<String, dynamic>?;
      profileDetails = getUserProfileRecords(
          user: Get.arguments['userDetails'] as CurrentUser, context: context);
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
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              profileDetails = getUserProfileRecords(
                  user: Get.arguments['userDetails'] as CurrentUser,
                  context: context);
            });
          },
          child: SingleChildScrollView(
            child: FutureBuilder<Map<String, dynamic>?>(
              initialData: cachedProfileDetails,
              future: profileDetails,
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>?> snapShot) {
                final UserProfile? _userProfile = snapShot.data == null
                    ? null
                    : snapShot.data!.isEmpty
                        ? null
                        : UserProfile.fromJson(snapShot.data);
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[50]!,
                    period: const Duration(milliseconds: 800),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100.w,
                          height: 100.sp.clamp(100, 200),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(10.sp.clamp(10, 20))),
                          margin: EdgeInsets.symmetric(
                                  horizontal: 15.sp.clamp(15, 30))
                              .copyWith(top: 10.sp),
                        ),
                        SizedBox(
                          height: 10.sp.clamp(10, 20),
                        ),
                        buildLineDec(length: 90.w),
                        buildLineDec(length: 70.w),
                        buildLineDec(length: 100.w),
                        buildLineDec(length: 80.w),
                        buildLineDec(length: 75.w),
                        SizedBox(
                          height: 15.sp.clamp(15, 25),
                        ),
                        Row(
                          children: <Widget>[
                            const Spacer(),
                            Container(
                              width: 100.w / 4,
                              height: 40.sp.clamp(40, 60),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.circular(2.sp.clamp(4, 10))),
                            ),
                            const Spacer(),
                            Container(
                              width: 100.w / 4,
                              height: 40.sp.clamp(40, 60),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.circular(2.sp.clamp(4, 10))),
                            ),
                            const Spacer(),
                            Container(
                              width: 100.w / 4,
                              height: 40.sp.clamp(40, 60),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.circular(2.sp.clamp(4, 10))),
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 15.sp.clamp(15, 25),
                        ),
                        Row(
                          children: <Widget>[
                            const Spacer(),
                            Container(
                              width: 100.w / 4,
                              height: 40.sp.clamp(40, 60),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.circular(2.sp.clamp(4, 10))),
                            ),
                            const Spacer(),
                            Container(
                              width: 100.w / 4,
                              height: 40.sp.clamp(40, 60),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.circular(2.sp.clamp(4, 10))),
                            ),
                            const Spacer(),
                            Container(
                              width: 100.w / 4,
                              height: 40.sp.clamp(40, 60),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.circular(2.sp.clamp(4, 10))),
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 15.sp.clamp(15, 25),
                        ),
                        Container(
                          width: 100.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(10.sp.clamp(10, 20))),
                          margin: EdgeInsets.symmetric(
                                  horizontal: 15.sp.clamp(15, 30))
                              .copyWith(top: 10.sp),
                        ),
                        SizedBox(
                          height: 20.sp.clamp(20, 35),
                        ),
                      ],
                    ),
                  );
                }
                if (!snapShot.hasData) {
                  SizedBox(
                    width: 100.w,
                    height: 100.01.h,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Network error!, Please swipe down to refresh once your internet connection is back',
                          style: TextStyle(fontSize: 14.sp),
                        )
                      ],
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (snapShot.hasError)
                      Container(
                        width: 100.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp.clamp(10, 50),
                            vertical: 5.sp.clamp(5, 15)),
                        color: Colors.grey[100],
                        child: Text(
                          'Their appear to be a network error, swipe down to refresh.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp.clamp(12, 18),
                              color: Colors.red[800]),
                        ),
                      ),
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
                                    child: Image.network(
                                      _userProfile?.avatar ??
                                          'https://image.flaticon.com/icons/png/512/2922/2922506.png',
                                      fit: BoxFit.cover,
                                    ),
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
                                        borderRadius:
                                            BorderRadius.circular(40.sp),
                                        border: Border.all(
                                            width: 2, color: Colors.white)),
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
                        buildAccHint(title: 'Post', count: 0),
                        buildAccHint(
                            title: 'Followers',
                            count: _userProfile?.followers ?? 0),
                        buildAccHint(
                            title: 'Following',
                            count: _userProfile?.following ?? 0),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.sp)
                          .copyWith(top: 20.sp),
                      child: Text(
                        _activeUser?.username.capitalize ?? 'no_one',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.sp)
                          .copyWith(top: 5.sp),
                      child: Text(
                        _activeUser?.bio != null
                            ? _activeUser!.bio.isEmpty
                                ? 'I am a user of Ecodeem'
                                : _activeUser!.bio
                            : 'I am a user of Ecodeem',
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
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
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[100]),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.white.withOpacity(0.1)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.sp),
                                        side: BorderSide(
                                            color: Colors.grey[800]!)),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      Size(70.sp, 30.sp))),
                              child: Text(
                                'Edit Details',
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
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[100]),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.white.withOpacity(0.1)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.sp),
                                        side: BorderSide(
                                            color: Colors.grey[800]!)),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      Size(70.sp, 30.sp))),
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
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[100]),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.white.withOpacity(0.1)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.sp),
                                        side: BorderSide(
                                            color: Colors.grey[800]!)),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      Size(100.sp, 30.sp))),
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
                      height: 30.sp.clamp(40, 60),
                      margin: EdgeInsets.symmetric(horizontal: 10.sp)
                          .copyWith(top: 15.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xfff2f2f2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTab = AccountTabs.myPost;
                              });
                            },
                            child: Container(
                              width: 26.w,
                              height: 30.sp.clamp(40, 60),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 2.sp),
                              child: Text(
                                'My Posts',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: currentTab == AccountTabs.myPost
                                      ? Colors.black
                                      : Colors.grey[800],
                                  fontSize: 12.sp.clamp(10, 18),
                                  fontWeight: currentTab == AccountTabs.myPost
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTab = AccountTabs.savedPost;
                              });
                            },
                            child: Container(
                              width: 26.w,
                              height: 30.sp.clamp(40, 60),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 2.sp),
                              child: Text(
                                'Saved Posts',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: currentTab == AccountTabs.savedPost
                                      ? Colors.black
                                      : Colors.grey[800],
                                  fontSize: 12.sp.clamp(10, 18),
                                  fontWeight:
                                      currentTab == AccountTabs.savedPost
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTab = AccountTabs.campaign;
                              });
                            },
                            child: Container(
                              width: 26.w,
                              height: 30.sp.clamp(40, 60),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 2.sp),
                              child: Text(
                                'Campaign',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: currentTab == AccountTabs.campaign
                                      ? Colors.black
                                      : Colors.grey[800],
                                  fontSize: 12.sp.clamp(10, 18),
                                  fontWeight: currentTab == AccountTabs.campaign
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildAccHint({required String title, required int count}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.sp),
    child: Column(
      children: <Widget>[
        Text(
          '$count',
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
