/// postedBy : '6065276421277c66d0718fd5'
/// postDesc : 'Please help us raise fund for these children'
/// interest : {'_id':'60baaa040900ee269884530e','interest':'Quality Education'}
/// postType : 'raiseFund'
/// imageUrl : 'https://images.unsplash.com/photo-1517404215738-15263e9f9178?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
/// videoUrl : 'https://www.youtube.com/watch?v=HFBB9u9glgo'
/// fundRaise : {'minAmount':30,'maxAmount':200,'donationPercentage':50}
/// counts : {'likesCount':0,'commentCount':0,'shareCount':0,'donorsCount':0,'viewsCount':0}

class FundedPost {
  FundedPost(
      {required this.postedBy,
      required this.postDesc,
      this.interest,
      required this.postType,
      this.imageUrl,
      this.videoUrl,
      this.fundRaise,
      this.counts});

  FundedPost.fromJson(dynamic json) {
    postedBy = json['postedBy'].toString();
    postDesc = json['postDesc'].toString();
    interest =
        json['interest'] != null ? Interest.fromJson(json['interest']) : null;
    postType = json['postType'].toString();
    imageUrl = json['imageUrl'].toString();
    videoUrl = json['videoUrl'].toString();
    fundRaise = json['fundRaise'] != null
        ? FundRaise.fromJson(json['fundRaise'])
        : null;
    counts = json['counts'] != null ? Counts.fromJson(json['counts']) : null;
  }
  late String postedBy;
  late String postDesc;
  Interest? interest;
  late String postType;
  String? imageUrl;
  String? videoUrl;
  FundRaise? fundRaise;
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
    map['videoUrl'] = videoUrl;
    if (fundRaise != null) {
      map['fundRaise'] = fundRaise?.toJson();
    }
    if (counts != null) {
      map['counts'] = counts?.toJson();
    }
    return map;
  }
}

/// minAmount : 30
/// maxAmount : 200
/// donationPercentage : 50

class FundRaise {
  FundRaise(
      {required this.minAmount,
      required this.maxAmount,
      required this.donationPercentage});

  FundRaise.fromJson(dynamic json) {
    minAmount = json['minAmount'] as int;
    maxAmount = json['maxAmount'] as int;
    donationPercentage = json['donationPercentage'] as int;
  }
  late int minAmount;
  late int maxAmount;
  late int donationPercentage;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['minAmount'] = minAmount;
    map['maxAmount'] = maxAmount;
    map['donationPercentage'] = donationPercentage;
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
