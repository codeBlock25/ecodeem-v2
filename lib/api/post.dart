import 'package:dio/dio.dart';
import 'package:ecodeem/api/active_user.dart';
import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/config/config.dart';
import 'package:ecodeem/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

/// postedBy : '6065276421277c66d0718fd5'
/// postDesc : 'Check out my new smasung A50'
/// interest : {'_id':'60baa9b00900ee269884530c','interest':'Zero Hunger'}
/// postType : 'text'
/// counts : {'likesCount':0,'commentCount':0,'shareCount':0,'donorsCount':0,'viewsCount':0}

class Post {
  Post(
      {required this.postedBy,
      required this.postDesc,
      this.interest,
      required this.postType,
      this.counts});

  Post.fromJson(dynamic json) {
    postedBy = json['postedBy'].toString();
    postDesc = json['postDesc'].toString();
    interest = json['interest'] != null
        ? InterestLint.fromJson(json['interest'])
        : null;
    postType = json['postType'].toString();
    counts = json['counts'] != null ? Counts.fromJson(json['counts']) : null;
  }

  late String postedBy;
  late String postDesc;
  late InterestLint? interest;
  late String postType;
  late Counts? counts;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['postedBy'] = postedBy;
    map['postDesc'] = postDesc;
    if (interest != null) {
      map['interest'] = interest?.toJson();
    }
    map['postType'] = postType;
    if (counts != null) {
      map['counts'] = counts?.toJson();
    }
    return map;
  }
}

/// likesCount : 0
/// commentCount : 0
/// shareCount : 0
/// donorsCount : 0
/// viewsCount : 0

class Counts {
  Counts(
      {required this.likesCount,
      required this.commentCount,
      required this.shareCount,
      required this.donorsCount,
      required this.viewsCount});

  Counts.fromJson(dynamic json) {
    likesCount = json['likesCount'] as int;
    commentCount = json['commentCount'] as int;
    shareCount = json['shareCount'] as int;
    donorsCount = json['donorsCount'] as int;
    viewsCount = json['viewsCount'] as int;
  }
  late int likesCount;
  late int commentCount;
  late int shareCount;
  late int donorsCount;
  late int viewsCount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['likesCount'] = likesCount;
    map['commentCount'] = commentCount;
    map['shareCount'] = shareCount;
    map['donorsCount'] = donorsCount;
    map['viewsCount'] = viewsCount;
    return map;
  }
}

/// _id : '60baa9b00900ee269884530c'
/// interest : 'Zero Hunger'

class InterestLint {
  InterestLint({this.id, this.interest});

  InterestLint.fromJson(dynamic json) {
    id = json['_id'].toString();
    interest = json['interest'].toString();
  }
  String? id;
  String? interest;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = id;
    map['interest'] = interest;
    return map;
  }
}

Future<void> uploadPost(
    {required GlobalKey<FormState> formKey,
    required TextEditingController postDesc,
    required Interest? interest,
    required ActiveUser activeUser,
    required PersistentTabController controller,
    required BuildContext context}) async {
  final Dio _dio = Dio();
  if (interest == null) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        'Select an interest this post belongs to!',
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }
  await _dio
      .post('${Api.url}/post/create',
          data: <String, dynamic>{
            'postDesc': postDesc.text,
            'interest': interest.sId,
            'postType': 'text'
          },
          options: Options(headers: <String, dynamic>{
            'authorization': 'Bearer ${activeUser.token}'
          }))
      .then((Response<dynamic> value) async {
    Get.back();
    final SnackBar snackBar = SnackBar(
      content: Text(
        'Post uploaded!',
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
      ),
      backgroundColor: primaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    postDesc.text = '';
    controller.jumpToTab(0);
  }).catchError((dynamic error) {
    Get.back();
    if (error.runtimeType == DioError) {
      final DioError err = error as DioError;
      final SnackBar snackBar = SnackBar(
        content: Text(
          err.response?.data['message'].toString() ?? 'Network Error.',
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    final SnackBar snackBar = SnackBar(
      content: Text(
        'Network Error',
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
}
