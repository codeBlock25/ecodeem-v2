import 'package:dio/dio.dart';
import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/config/config.dart';
import 'package:ecodeem/generated/assets.dart';
import 'package:ecodeem/model/user.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Response;
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class SocialHome extends StatefulWidget {
  const SocialHome({Key? key}) : super(key: key);

  @override
  _SocialHomeState createState() => _SocialHomeState();
}

class _SocialHomeState extends State<SocialHome> {
  Future<List<dynamic>>? posts;
  Future<List<dynamic>>? interests;
  final InterestController _interestController = Get.put(InterestController());
  final Dio _dio = Dio();
  Future<List<dynamic>> loadPosts({int page = 1}) async {
    List<dynamic> _posts = <dynamic>[];
    final ActiveUser _activeUser = Get.arguments['userDetails'] as ActiveUser;
    await _dio
        .get('${Api.url}/post/timeline',
            options: Options(headers: <String, dynamic>{
              'authorization': 'Bearer ${_activeUser.token}'
            }))
        .then((Response<dynamic> value) {
      _posts =
          value.data['data']['timelinePosts'] as List<dynamic>? ?? <dynamic>[];
    }).catchError((dynamic error) {
      print(error);
      if (error.runtimeType == DioError) {
        final DioError err = error as DioError;
        final SnackBar snackBar = SnackBar(
          content: Text(
            err.response?.data['message'].toString() ?? 'Network Error',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      const SnackBar snackBar = SnackBar(
        content: Text(
          'Network Error',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    return _posts;
  }

  Future<List<dynamic>> loadInterests() async {
    List<dynamic> _interests = <dynamic>[];
    final ActiveUser _activeUser = Get.arguments['userDetails'] as ActiveUser;
    await _dio
        .get('${Api.url}/interest/user-all',
            options: Options(headers: <String, dynamic>{
              'authorization': 'Bearer ${_activeUser.token}'
            }))
        .then((Response<dynamic> value) {
      _interests =
          value.data['data']['interests'] as List<dynamic>? ?? <dynamic>[];
    }).catchError((dynamic error) {
      print(error);
      if (error.runtimeType == DioError) {
        final DioError err = error as DioError;
        final SnackBar snackBar = SnackBar(
          content: Text(
            err.response?.data['message'].toString() ?? 'Network Error',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      const SnackBar snackBar = SnackBar(
        content: Text(
          'Network Error',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    return _interests;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      posts = loadPosts();
      interests = loadInterests();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSocialAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          final Future<List<dynamic>> _post = loadPosts();
          setState(() {
            posts = _post;
          });
        },
        child: FutureBuilder<List<dynamic>>(
          initialData: _interestController.availableInterest,
          future: posts,
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapShot) {
            if (snapShot.hasError) {
              return SingleChildScrollView(
                  child: SizedBox(
                width: 100.w,
                height: 100.5.h,
                child: Column(
                  children: <Widget>[
                    Text(
                      '${snapShot.error}',
                      style: TextStyle(fontSize: 14.sp),
                    )
                  ],
                ),
              ));
            } else if (snapShot.connectionState == ConnectionState.waiting ||
                snapShot.connectionState == ConnectionState.none) {
              return Center(
                child: SizedBox(
                  width: 30.sp,
                  height: 30.sp,
                  child: const CircularProgressIndicator(
                    color: primaryColor,
                    backgroundColor: Colors.white,
                  ),
                ),
              );
            } else if (snapShot.data!.isEmpty) {
              return SingleChildScrollView(
                  child: SizedBox(
                width: 100.w,
                height: 100.5.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(Assets.iconsSocialMedia,
                        width: 50.sp, fit: BoxFit.fitWidth),
                    Text(
                      'No posts yet.',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      'Swipe down to Refresh.',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ));
            } else {
              return SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Text(
                          'My Interest',
                          style: TextStyle(
                              fontSize: 12.sp.clamp(12, 18),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 35.sp,
                                  height: 35.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xffeaece7),
                                  ),
                                  child: const Icon(Ionicons.add_circle),
                                ),
                                Text(
                                  'My Interests',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 8.sp.clamp(10, 15),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          FutureBuilder<dynamic>(
                            future: interests,
                            builder: (BuildContext content,
                                AsyncSnapshot<Object?> snapShot) {
                              if (snapShot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox();
                              } else if (snapShot.hasError) {
                                return const SizedBox();
                              } else {
                                final List<dynamic>? rawData =
                                    snapShot.data as List<dynamic>?;
                                return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ...rawData!.map((dynamic interestRaw) {
                                        final Interest _interest = interestRaw
                                                    .runtimeType ==
                                                Interest
                                            ? interestRaw as Interest
                                            : Interest.fromJson(interestRaw);
                                        _interestController
                                            .addToInterests(_interest);
                                        return Container(
                                          width: 60.sp,
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                width: 35.sp,
                                                height: 35.sp,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    color:
                                                        const Color(0xffeaece7),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            _interest.image))),
                                              ),
                                              Text(
                                                _interest.interest,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8.sp.clamp(10, 15),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ]);
                              }
                            },
                          ),
                        ]),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Text(
                          'Live / Stories',
                          style: TextStyle(
                              fontSize: 12.sp.clamp(12, 18),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 50.sp.clamp(70, 150),
                                  height: 80.sp.clamp(100, 180),
                                  margin: EdgeInsets.only(bottom: 5.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.sp),
                                    color: const Color(0xffeaece7),
                                  ),
                                  child: const Icon(Ionicons.add_circle),
                                ),
                                Text(
                                  'Add Story \n/ Go Live',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp.clamp(10, 18),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ...allUsers.map((User user) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 50.sp.clamp(70, 150),
                                    height: 80.sp.clamp(100, 180),
                                    margin: EdgeInsets.only(bottom: 5.sp),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffeaece7),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              user.urlAvatar,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Text(
                                    user.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp.clamp(10, 18),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ]),
                  ),
                  const PostView(),
                  const PostView(),
                  const PostView(),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ));
            }
          },
        ),
      ),
    );
  }
}

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width / 0.9,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(Assets.designBg1, fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'John Jeo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      '1 d',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  Assets.designBg1,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text(
                  '3.2k',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '1.1k',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '1k',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Icon(UniconsLine.thumbs_up),
                    SizedBox(width: 10.74),
                    Text(
                      'Like',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Icon(UniconsLine.chat),
                    SizedBox(width: 10.74),
                    Text(
                      'Comment',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Icon(UniconsLine.share),
                    SizedBox(width: 10.74),
                    Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
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

List<User> allUsers = <User>[];
