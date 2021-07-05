import 'package:ecodeem/api/reward.dart';
import 'package:ecodeem/utility/utility.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActiveUser {
  ActiveUser(
      {Reward? reward,
      required bool isActive,
      required bool isVerified,
      required bool accountConfirm,
      required String ipAddress,
      required String avatar,
      required String id,
      required String firstName,
      required String lastName,
      required String username,
      required String email,
      required String token,
      required String phoneNumber,
      required String country,
      required String state,
      required String referralCode,
      required String appID,
      required String confirmationCode,
      required String date,
      required String createdAt,
      required String updatedAt,
      required int v}) {
    _reward = reward;
    _isActive = isActive;
    _isVerified = isVerified;
    _accountConfirm = accountConfirm;
    _ipAddress = ipAddress;
    _avatar = avatar;
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _email = email;
    _token = token;
    _phoneNumber = phoneNumber;
    _country = country;
    _state = state;
    _referralCode = referralCode;
    _appID = appID;
    _confirmationCode = confirmationCode;
    _date = date.toDate();
    _createdAt = createdAt.toDate();
    _updatedAt = updatedAt.toDate();
    _v = v;
  }

  ActiveUser.fromJson(dynamic json) {
    _isActive = json['isActive'] as bool;
    _reward = json['reward'] != null ? Reward.fromJson(json['reward']) : null;
    _isVerified = json['isVerified'] as bool;
    _accountConfirm = json['accountConfirm'] as bool;
    _ipAddress = json['ipAddress'].toString();
    _avatar = json['avatar'].toString();
    _id = json['_id'].toString();
    _firstName = json['firstName'].toString();
    _lastName = json['lastName'].toString();
    _username = json['username'].toString();
    _email = json['email'].toString();
    _token = json['token'].toString();
    _phoneNumber = json['phoneNumber'].toString();
    _country = json['country'].toString();
    _state = json['state'].toString();
    _referralCode = json['referralCode'].toString();
    _appID = json['appID'].toString();
    _confirmationCode = json['confirmationCode'].toString();
    _date = json['date'].toString().toDate();
    _createdAt = json['createdAt'].toString().toDate();
    _updatedAt = json['updatedAt'].toString().toDate();
    _v = json['__v'] as int;
  }

  Reward? _reward;
  late bool _isActive;
  late bool _isVerified;
  late bool _accountConfirm;
  late String _ipAddress;
  late String _avatar;
  late String _id;
  late String _firstName;
  late String _lastName;
  late String _username;
  late String _email;
  late String _token;
  late String _phoneNumber;
  late String _country;
  late String _state;
  late String _referralCode;
  late String _appID;
  late String _confirmationCode;
  late DateTime _date;
  late DateTime _createdAt;
  late DateTime _updatedAt;
  late int _v;

  Reward? get reward => _reward;
  bool get isActive => _isActive;
  bool get isVerified => _isVerified;
  bool get accountConfirm => _accountConfirm;
  String get ipAddress => _ipAddress;
  String get avatar => _avatar;
  String get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get username => _username;
  String get email => _email;
  String get token => _token;
  String get phoneNumber => _phoneNumber;
  String get country => _country;
  String get state => _state;
  String get referralCode => _referralCode;
  String get appID => _appID;
  String get confirmationCode => _confirmationCode;
  DateTime get date => _date;
  DateTime get createdAt => _createdAt;
  DateTime get updatedAt => _updatedAt;
  int get v => _v;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['reward'] = _reward;
    map['isActive'] = _isActive;
    map['isVerified'] = _isVerified;
    map['accountConfirm'] = _accountConfirm;
    map['ipAddress'] = _ipAddress;
    map['avatar'] = _avatar;
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['username'] = _username;
    map['email'] = _email;
    map['token'] = _token;
    map['phoneNumber'] = _phoneNumber;
    map['country'] = _country;
    map['state'] = _state;
    map['referralCode'] = _referralCode;
    map['appID'] = _appID;
    map['confirmationCode'] = _confirmationCode;
    map['date'] = DateFormat.yMd().format(_date);
    map['createdAt'] = DateFormat.yMd().format(_createdAt);
    map['updatedAt'] = DateFormat.yMd().format(_updatedAt);
    map['__v'] = _v;
    return map;
  }
}

class ActiveUserController extends GetxController {
  ActiveUser? activeUser;
  ActiveUser? get user {
    return activeUser;
  }

  set user(ActiveUser? user) {
    activeUser = user;
  }
}
