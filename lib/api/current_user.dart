/// settings : {"canLoginWithBio":false,"canPush":false,"rememberLogin":false,"lowData":false,"backgroundMode":false}
/// interests : []
/// isActive : true
/// isVerified : true
/// accountConfirm : true
/// ipAddress : "41.190.27.98"
/// avatar : ""
/// bio : ""
/// _id : "60f21bb754f66800156d41d2"
/// firstName : "Amos"
/// lastName : "Daniel"
/// username : "classic d"
/// email : "jamesadam.business@gmail.com"
/// phoneNumber : "07013891444"
/// country : "Nigeria"
/// state : "Abuja"
/// referralCode : "eco-amos-332747"
/// appID : "70b8a71f7a3762b4-eco-564727c63d86d5-381c843a80"
/// confirmationCode : null
/// date : "2021-07-16T23:52:23.551Z"
/// createdAt : "2021-07-16T23:52:23.552Z"
/// updatedAt : "2021-07-16T23:58:31.817Z"
/// __v : 4

class CurrentUser {
  Settings? settings;
  List<dynamic>? interests;
  bool? isActive;
  bool? isVerified;
  bool? accountConfirm;
  String? ipAddress;
  String? avatar;
  String? bio;
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phoneNumber;
  String? country;
  String? state;
  String? referralCode;
  String? appID;
  dynamic? confirmationCode;
  String? date;
  String? createdAt;
  String? updatedAt;
  int? v;

  CurrentUser({
      this.settings, 
      this.interests, 
      this.isActive, 
      this.isVerified, 
      this.accountConfirm, 
      this.ipAddress, 
      this.avatar, 
      this.bio, 
      this.id, 
      this.firstName, 
      this.lastName, 
      this.username, 
      this.email, 
      this.phoneNumber, 
      this.country, 
      this.state, 
      this.referralCode, 
      this.appID, 
      this.confirmationCode, 
      this.date, 
      this.createdAt, 
      this.updatedAt, 
      this.v});

  CurrentUser.fromJson(dynamic json) {
    settings = json["settings"] != null ? Settings.fromJson(json["settings"]) : null;
    if (json["interests"] != null) {
      interests = [];
      json["interests"].forEach((v) {
        interests?.add(dynamic.fromJson(v));
      });
    }
    isActive = json["isActive"];
    isVerified = json["isVerified"];
    accountConfirm = json["accountConfirm"];
    ipAddress = json["ipAddress"];
    avatar = json["avatar"];
    bio = json["bio"];
    id = json["_id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    username = json["username"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    country = json["country"];
    state = json["state"];
    referralCode = json["referralCode"];
    appID = json["appID"];
    confirmationCode = json["confirmationCode"];
    date = json["date"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (settings != null) {
      map["settings"] = settings?.toJson();
    }
    if (interests != null) {
      map["interests"] = interests?.map((v) => v.toJson()).toList();
    }
    map["isActive"] = isActive;
    map["isVerified"] = isVerified;
    map["accountConfirm"] = accountConfirm;
    map["ipAddress"] = ipAddress;
    map["avatar"] = avatar;
    map["bio"] = bio;
    map["_id"] = id;
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["username"] = username;
    map["email"] = email;
    map["phoneNumber"] = phoneNumber;
    map["country"] = country;
    map["state"] = state;
    map["referralCode"] = referralCode;
    map["appID"] = appID;
    map["confirmationCode"] = confirmationCode;
    map["date"] = date;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
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