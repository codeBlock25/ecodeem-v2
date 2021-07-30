/// _id : '60df561227c0020015851ae9'
/// postedBy : {'avatar':'http://res.cloudinary.com/ecodeemit/image/upload/v1625067069/jc7pds1ha0vmqouvzh3g.jpg','_id':'6065276421277c66d0718fd5','username':'ayo001'}
/// postDesc : 'Please help us raise fund for the child'
/// interest : {'_id':'60baaa040900ee269884530e','interest':'Quality Education'}
/// postType : 'raiseFund'
/// imageUrl : 'https://images.unsplash.com/photo-1517404215738-15263e9f9178?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
/// videoUrl : 'https://www.youtube.com/watch?v=HFBB9u9glgo'
/// fundRaise : {'minAmount':30,'maxAmount':100,'endDate':'Sat Jul 17 2021 00:00:00 GMT+0000 (Coordinated Universal Time)','startDate':'Fri Jul 02 2021 18:08:18 GMT+0000 (Coordinated Universal Time)','daysLeft':13,'totalReceived':0,'donationPercentage':0,'fundRaiseExpired':false,'fundRaiseCompleted':false}
/// counts : {'likesCount':0,'commentCount':0,'shareCount':0,'donorsCount':0,'viewsCount':0}
import 'package:ecodeem/utility/utility.dart';

enum PostType { text, image, video, raiseFund }

class TimeLinePost {
  TimeLinePost(
      {required this.id,
      required this.postedBy,
      required this.postDesc,
      required this.interest,
      required this.postType,
      this.imageUrl,
      this.videoUrl,
      this.fundRaise,
      required this.counts});

  TimeLinePost.fromJson(dynamic json) {
    id = json['_id'].toString();
    postedBy = PostedBy.fromJson(json['postedBy']);
    postDesc = json['postDesc'].toString();
    interest = Interest.fromJson(json['interest']);
    postType = json['postType'].toString() == 'text'
        ? PostType.text
        : json['postType'].toString() == 'image'
            ? PostType.image
            : json['postType'].toString() == 'video'
                ? PostType.video
                : PostType.text;
    imageUrl = json['imageUrl'].toString();
    videoUrl = json['videoUrl'].toString();
    fundRaise =
        json['fundRaise'] != null || json['fundRaise'] != <String, dynamic>{}
            ? FundRaise.fromJson(json['fundRaise'])
            : null;
    counts = Counts.fromJson(json['counts']);
  }

  late String id;
  late PostedBy postedBy;
  late String postDesc;
  late Interest interest;
  late PostType postType;
  String? imageUrl;
  String? videoUrl;
  FundRaise? fundRaise;
  late Counts counts;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = id;
    map['postedBy'] = postedBy.toJson();
    map['postDesc'] = postDesc;
    map['interest'] = interest.toJson();
    map['postType'] = postType;
    map['imageUrl'] = imageUrl;
    map['videoUrl'] = videoUrl;
    if (fundRaise != null) {
      map['fundRaise'] = fundRaise?.toJson();
    }
    map['counts'] = counts.toJson();
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

/// minAmount : 30
/// maxAmount : 100
/// endDate : 'Sat Jul 17 2021 00:00:00 GMT+0000 (Coordinated Universal Time)'
/// startDate : 'Fri Jul 02 2021 18:08:18 GMT+0000 (Coordinated Universal Time)'
/// daysLeft : 13
/// totalReceived : 0
/// donationPercentage : 0
/// fundRaiseExpired : false
/// fundRaiseCompleted : false

class FundRaise {
  FundRaise(
      {required this.minAmount,
      required this.maxAmount,
      required this.endDate,
      required this.startDate,
      required this.daysLeft,
      required this.totalReceived,
      required this.donationPercentage,
      required this.fundRaiseExpired,
      required this.fundRaiseCompleted});

  FundRaise.fromJson(dynamic json) {
    minAmount = json['minAmount'] as int;
    maxAmount = json['maxAmount'] as int;
    endDate = json['endDate'].toString().toDate();
    startDate = json['startDate'].toString().toDate();
    daysLeft = json['daysLeft'] as int;
    totalReceived = json['totalReceived'] as int;
    donationPercentage = json['donationPercentage'] as int;
    fundRaiseExpired = json['fundRaiseExpired'] as bool;
    fundRaiseCompleted = json['fundRaiseCompleted'] as bool;
  }
  late int minAmount;
  late int maxAmount;
  late DateTime endDate;
  late DateTime startDate;
  late int daysLeft;
  late int totalReceived;
  late int donationPercentage;
  late bool fundRaiseExpired;
  late bool fundRaiseCompleted;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['minAmount'] = minAmount;
    map['maxAmount'] = maxAmount;
    map['endDate'] = endDate;
    map['startDate'] = startDate;
    map['daysLeft'] = daysLeft;
    map['totalReceived'] = totalReceived;
    map['donationPercentage'] = donationPercentage;
    map['fundRaiseExpired'] = fundRaiseExpired;
    map['fundRaiseCompleted'] = fundRaiseCompleted;
    return map;
  }
}

/// _id : '60baaa040900ee269884530e'
/// interest : 'Quality Education'

class Interest {
  Interest({required this.id, required this.interest});

  Interest.fromJson(dynamic json) {
    id = json['_id'].toString();
    interest = json['interest'].toString();
  }

  late String id;
  late String interest;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = id;
    map['interest'] = interest;
    return map;
  }
}

/// avatar : 'http://res.cloudinary.com/ecodeemit/image/upload/v1625067069/jc7pds1ha0vmqouvzh3g.jpg'
/// _id : '6065276421277c66d0718fd5'
/// username : 'ayo001'

class PostedBy {
  PostedBy({required this.avatar, required this.id, required this.username});

  PostedBy.fromJson(dynamic json) {
    avatar = json['avatar'].toString();
    id = json['_id'].toString();
    username = json['username'].toString();
  }
  late String avatar;
  late String id;
  late String username;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['avatar'] = avatar;
    map['_id'] = id;
    map['username'] = username;
    return map;
  }
}
