/// _id : '60f21bb754f66800156d41d2'
/// reward : {'level':0,'title':'NEWBIE'}
/// ipAddress : '41.190.27.98'
/// firstName : 'Amos'
/// lastName : 'Daniel'
/// username : 'classic d'
/// email : 'jamesadam.business@gmail.com'
/// avatar : '
/// phoneNumber : '07013891444'
/// country : 'Nigeria'
/// state : 'Abuja'
/// isActive : true
/// isVerified : true
/// accountConfirm : true
/// appID : '70b8a71f7a3762b4-eco-564727c63d86d5-381c843a80'
/// referralCode : 'eco-amos-332747'
/// date : '2021-07-16T23:52:23.551Z'
/// following : 0
/// followers : 0
/// settings : {'canLoginWithBio':false,'canPush':false,'rememberLogin':false,'lowData':false,'backgroundMode':false}
import 'package:ecodeem/controller/controller.dart';
import 'package:ecodeem/utility/utility.dart';

class UserProfile {
  UserProfile(
      {this.id,
      this.reward,
      this.ipAddress,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.avatar,
      this.phoneNumber,
      this.country,
      this.state,
      this.isActive,
      this.isVerified,
      this.accountConfirm,
      this.appID,
      this.referralCode,
      this.date,
      this.following,
      this.followers,
      this.posts,
      this.settings});

  UserProfile.fromJson(dynamic json) {
    id = json['_id'].toString();
    reward = json['reward'] != null ? Reward.fromJson(json['reward']) : null;
    ipAddress = json['ipAddress'].toString();
    firstName = json['firstName'].toString();
    lastName = json['lastName'].toString();
    username = json['username'].toString();
    email = json['email'].toString();
    avatar = json['avatar'].toString();
    phoneNumber = json['phoneNumber'].toString();
    country = json['country'].toString();
    state = json['state'].toString();
    isActive = json['isActive'] as bool?;
    isVerified = json['isVerified'] as bool?;
    accountConfirm = json['accountConfirm'] as bool?;
    appID = json['appID'].toString();
    referralCode = json['referralCode'].toString();
    date = json['date'].toString().toDate();
    following = json['following'] as int;
    followers = json['followers'] as int;
    posts = json['posts'] as List<dynamic>;
    settings =
        json['settings'] != null ? Settings.fromJson(json['settings']) : null;
  }
  String? id;
  Reward? reward;
  String? ipAddress;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? phoneNumber;
  String? country;
  String? state;
  bool? isActive;
  bool? isVerified;
  bool? accountConfirm;
  String? appID;
  String? referralCode;
  DateTime? date;
  int? following;
  int? followers;
  List<dynamic>? posts;
  Settings? settings;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = id;
    if (reward != null) {
      map['reward'] = reward?.toJson();
    }
    map['ipAddress'] = ipAddress;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['avatar'] = avatar;
    map['phoneNumber'] = phoneNumber;
    map['country'] = country;
    map['state'] = state;
    map['isActive'] = isActive;
    map['isVerified'] = isVerified;
    map['accountConfirm'] = accountConfirm;
    map['appID'] = appID;
    map['referralCode'] = referralCode;
    map['date'] = date;
    map['following'] = following;
    map['followers'] = followers;
    map['posts'] = posts;
    if (settings != null) {
      map['settings'] = settings?.toJson();
    }
    return map;
  }
}
