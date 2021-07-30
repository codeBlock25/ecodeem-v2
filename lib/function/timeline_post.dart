/// _id : '60f639e1d33b5c0015887def'
/// postedBy : {'avatar':','_id':'60f6383bd33b5c0015887dcd','username':'classic-2'}
/// postDesc : 'testing'
/// interest : {'_id':'60baa9610900ee269884530b','interest':'No Poverty'}
/// postType : 'text'
/// counts : {'likesCount':0,'commentCount':0,'shareCount':0,'donorsCount':0,'viewsCount':0}
/// likes : [']

class TimelinePost {
  TimelinePost(
      {this.id,
      this.postedBy,
      this.postDesc,
      this.interest,
      this.postType,
      this.counts,
      this.likes});

  TimelinePost.fromJson(dynamic json) {
    id = json['_id'].toString();
    postedBy =
        json['postedBy'] != null ? PostedBy.fromJson(json['postedBy']) : null;
    postDesc = json['postDesc'].toString();
    interest =
        json['interest'] != null ? Interest.fromJson(json['interest']) : null;
    postType = json['postType'].toString();
    counts = json['counts'] != null ? Counts.fromJson(json['counts']) : null;
    likes = json['likes'] != null
        ? List.castFrom(json['likes'] as List<dynamic>)
        : <String>[];
  }

  String? id;
  PostedBy? postedBy;
  String? postDesc;
  Interest? interest;
  String? postType;
  Counts? counts;
  List<String>? likes;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = id;
    if (postedBy != null) {
      map['postedBy'] = postedBy?.toJson();
    }
    map['postDesc'] = postDesc;
    if (interest != null) {
      map['interest'] = interest?.toJson();
    }
    map['postType'] = postType;
    if (counts != null) {
      map['counts'] = counts?.toJson();
    }
    map['likes'] = likes;
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
      {this.likesCount,
      this.commentCount,
      this.shareCount,
      this.donorsCount,
      this.viewsCount});

  Counts.fromJson(dynamic json) {
    likesCount = json['likesCount'] as int;
    commentCount = json['commentCount'] as int;
    shareCount = json['shareCount'] as int;
    donorsCount = json['donorsCount'] as int;
    viewsCount = json['viewsCount'] as int;
  }

  int? likesCount;
  int? commentCount;
  int? shareCount;
  int? donorsCount;
  int? viewsCount;

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

/// _id : '60baa9610900ee269884530b'
/// interest : 'No Poverty'

class Interest {
  Interest({this.id, this.interest});

  Interest.fromJson(dynamic json) {
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

/// avatar : '
/// _id : '60f6383bd33b5c0015887dcd'
/// username : 'classic-2'

class PostedBy {
  PostedBy({this.avatar, this.id, this.username});

  PostedBy.fromJson(dynamic json) {
    avatar = json['avatar'].toString();
    id = json['_id'].toString();
    username = json['username'].toString();
  }
  String? avatar;
  String? id;
  String? username;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['avatar'] = avatar;
    map['_id'] = id;
    map['username'] = username;
    return map;
  }
}
