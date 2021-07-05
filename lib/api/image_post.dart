/// postedBy : '6065276421277c66d0718fd5'
/// postDesc : 'Check out my new smasung A50'
/// interest : {'_id':'60baa9b00900ee269884530c','interest':'Zero Hunger'}
/// postType : 'video'
/// videoUrl : 'https://www.youtube.com/watch?v=0bLjYvPWvNM'
/// counts : {'likesCount':0,'commentCount':0,'shareCount':0,'donorsCount':0,'viewsCount':0}

class ImagePost {
  ImagePost(
      {required this.postedBy,
      required this.postDesc,
      this.interest,
      required this.postType,
      required this.imageUrl,
      this.counts});

  ImagePost.fromJson(dynamic json) {
    postedBy = json['postedBy'].toString();
    postDesc = json['postDesc'].toString();
    interest =
        json['interest'] != null ? Interest.fromJson(json['interest']) : null;
    postType = json['postType'].toString();
    imageUrl = json['imageUrl'].toString();
    counts = json['counts'] != null ? Counts.fromJson(json['counts']) : null;
  }

  late String postedBy;
  late String postDesc;
  Interest? interest;
  late String postType;
  late String imageUrl;
  Counts? counts;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['postedBy'] = postedBy;
    map['postDesc'] = postDesc;
    if (interest != null) {
      map['interest'] = interest?.toJson();
    }
    map['postType'] = postType;
    map['imageUrl'] = imageUrl;
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
