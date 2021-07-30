// import 'package:blobs/blobs.dart';
import 'package:ecodeem/controller/controller.dart';
import 'package:ecodeem/function/post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

/// postedBy : '6065276421277c66d0718fd5'
/// postDesc : 'Check out my new samsung A50'
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

  Future<void> upload(
      {required GlobalKey<FormState> formKey,
      required TextEditingController postDesc,
      required Interest interest,
      required CurrentUser activeUser,
      required PersistentTabController controller,
      XFile? file,
      required PostType postType,
      required BuildContext context}) async {
    return uploadPost(
        formKey: formKey,
        postDesc: postDesc,
        interest: interest,
        activeUser: activeUser,
        controller: controller,
        file: file,
        postType: postType,
        context: context);
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

enum PostType { text, video, image, fundImage, fundVideo, fundText }
