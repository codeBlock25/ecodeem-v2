/// _id : "60f21bb754f66800156d41d2"
/// reward : {"level":0,"title":"NEWBIE"}
/// ipAddress : "41.190.27.98"
/// firstName : "Amos"
/// lastName : "Daniel"
/// username : "classic d"
/// email : "jamesadam.business@gmail.com"
/// avatar : ""
/// phoneNumber : "07013891444"
/// country : "Nigeria"
/// state : "Abuja"
/// isActive : true
/// isVerified : true
/// accountConfirm : true
/// appID : "70b8a71f7a3762b4-eco-564727c63d86d5-381c843a80"
/// referralCode : "eco-amos-332747"
/// date : "2021-07-16T23:52:23.551Z"
/// following : 0
/// followers : 0
/// settings : {"canLoginWithBio":false,"canPush":false,"rememberLogin":false,"lowData":false,"backgroundMode":false}

class UserProfile {
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
  String? date;
  int? following;
  int? followers;
  Settings? settings;

  UserProfile({
      this.id, 
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
      this.settings});

  UserProfile.fromJson(dynamic json) {
    id = json["_id"];
    reward = json["reward"] != null ? Reward.fromJson(json["reward"]) : null;
    ipAddress = json["ipAddress"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    username = json["username"];
    email = json["email"];
    avatar = json["avatar"];
    phoneNumber = json["phoneNumber"];
    country = json["country"];
    state = json["state"];
    isActive = json["isActive"];
    isVerified = json["isVerified"];
    accountConfirm = json["accountConfirm"];
    appID = json["appID"];
    referralCode = json["referralCode"];
    date = json["date"];
    following = json["following"];
    followers = json["followers"];
    settings = json["settings"] != null ? Settings.fromJson(json["settings"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    if (reward != null) {
      map["reward"] = reward?.toJson();
    }
    map["ipAddress"] = ipAddress;
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["username"] = username;
    map["email"] = email;
    map["avatar"] = avatar;
    map["phoneNumber"] = phoneNumber;
    map["country"] = country;
    map["state"] = state;
    map["isActive"] = isActive;
    map["isVerified"] = isVerified;
    map["accountConfirm"] = accountConfirm;
    map["appID"] = appID;
    map["referralCode"] = referralCode;
    map["date"] = date;
    map["following"] = following;
    map["followers"] = followers;
    if (settings != null) {
      map["settings"] = settings?.toJson();
    }
    return map;
  }

}

/// canLoginWithBio : false
/// canPush : false
/// rememberLogin : false
/// lowData : false
/// backgroundMode : false

class Settings {
  bool? canLoginWithBio;
  bool? canPush;
  bool? rememberLogin;
  bool? lowData;
  bool? backgroundMode;

  Settings({
      this.canLoginWithBio, 
      this.canPush, 
      this.rememberLogin, 
      this.lowData, 
      this.backgroundMode});

  Settings.fromJson(dynamic json) {
    canLoginWithBio = json["canLoginWithBio"];
    canPush = json["canPush"];
    rememberLogin = json["rememberLogin"];
    lowData = json["lowData"];
    backgroundMode = json["backgroundMode"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["canLoginWithBio"] = canLoginWithBio;
    map["canPush"] = canPush;
    map["rememberLogin"] = rememberLogin;
    map["lowData"] = lowData;
    map["backgroundMode"] = backgroundMode;
    return map;
  }

}

/// level : 0
/// title : "NEWBIE"

class Reward {
  int? level;
  String? title;

  Reward({
      this.level, 
      this.title});

  Reward.fromJson(dynamic json) {
    level = json["level"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["level"] = level;
    map["title"] = title;
    return map;
  }

}