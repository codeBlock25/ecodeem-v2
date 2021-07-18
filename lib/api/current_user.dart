/// settings : {'canLoginWithBio':false,'canPush':false,'rememberLogin':false,'lowData':false,'backgroundMode':false}
/// interests : []
/// isActive : true
/// isVerified : true
/// accountConfirm : true
/// ipAddress : '41.190.27.98'
/// avatar : '
/// bio : '
/// _id : '60f21bb754f66800156d41d2'
/// firstName : 'Amos'
/// lastName : 'Daniel'
/// username : 'classic d'
/// email : 'jamesadam.business@gmail.com'
/// phoneNumber : '07013891444'
/// country : 'Nigeria'
/// state : 'Abuja'
/// referralCode : 'eco-amos-332747'
/// appID : '70b8a71f7a3762b4-eco-564727c63d86d5-381c843a80'
/// confirmationCode : null
/// date : '2021-07-16T23:52:23.551Z'
/// createdAt : '2021-07-16T23:52:23.552Z'
/// updatedAt : '2021-07-16T23:58:31.817Z'
/// __v : 4
import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/utility/utility.dart';
import 'package:get/get.dart';

class CurrentUser {
  CurrentUser(
      {required this.settings,
      required this.interests,
      required this.isActive,
      required this.isVerified,
      required this.accountConfirm,
      required this.ipAddress,
      required this.avatar,
      required this.bio,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.country,
      required this.state,
      required this.token,
      required this.referralCode,
      required this.appID,
      this.confirmationCode,
      required this.date,
      required this.createdAt,
      required this.updatedAt,
      required this.v});

  CurrentUser.fromJson(dynamic json) {
    settings = Settings.fromJson(json['settings']);
    if (json['interests'] != null) {
      interests = <dynamic>[];
      json['interests'].forEach((dynamic v) {
        interests.add(v);
      });
    }
    isActive = json['isActive'] as bool;
    isVerified = json['isVerified'] as bool;
    accountConfirm = json['accountConfirm'] as bool;
    ipAddress = json['ipAddress'].toString();
    avatar = json['avatar'].toString();
    bio = json['bio'].toString();
    id = json['_id'].toString();
    firstName = json['firstName'].toString();
    lastName = json['lastName'].toString();
    username = json['username'].toString();
    email = json['email'].toString();
    token = json['token'].toString();
    phoneNumber = json['phoneNumber'].toString();
    country = json['country'].toString();
    state = json['state'].toString();
    referralCode = json['referralCode'].toString();
    appID = json['appID'].toString();
    confirmationCode = json['confirmationCode'];
    date = json['date'].toString().toDate();
    createdAt = json['createdAt'].toString().toDate();
    updatedAt = json['updatedAt'].toString().toDate();
    v = json['__v'] as int;
  }

  late Settings settings;
  late List<dynamic> interests;
  late bool isActive;
  late bool isVerified;
  late bool accountConfirm;
  late String ipAddress;
  late String avatar;
  late String bio;
  late String id;
  late String firstName;
  late String lastName;
  late String username;
  late String email;
  late String token;
  late String phoneNumber;
  late String country;
  late String state;
  late String referralCode;
  late String appID;
  dynamic confirmationCode;
  late DateTime date;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int v;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['settings'] = settings.toJson();
    map['interests'] = interests.map((dynamic v) => v.toJson()).toList();
    map['isActive'] = isActive;
    map['isVerified'] = isVerified;
    map['accountConfirm'] = accountConfirm;
    map['ipAddress'] = ipAddress;
    map['avatar'] = avatar;
    map['bio'] = bio;
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['token'] = token;
    map['phoneNumber'] = phoneNumber;
    map['country'] = country;
    map['state'] = state;
    map['referralCode'] = referralCode;
    map['appID'] = appID;
    map['confirmationCode'] = confirmationCode;
    map['date'] = date;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class ActiveUserController extends GetxController {
  CurrentUser? user;
  CurrentUser? get currentUser {
    return user;
  }

  set currentUser(CurrentUser? newUser) {
    user = newUser;
  }
}
