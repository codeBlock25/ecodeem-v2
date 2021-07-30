/// canLoginWithBio : false
/// canPush : false
/// rememberLogin : false
/// lowData : false
/// backgroundMode : false

class GenSettings {
  GenSettings(
      {required this.canLoginWithBio,
      required this.canPush,
      required this.rememberLogin,
      required this.lowData,
      required this.backgroundMode});

  GenSettings.fromJson(dynamic json) {
    canLoginWithBio = json['canLoginWithBio'] as bool;
    canPush = json['canPush'] as bool;
    rememberLogin = json['rememberLogin'] as bool;
    lowData = json['lowData'] as bool;
    backgroundMode = json['backgroundMode'] as bool;
  }

  late bool canLoginWithBio;
  late bool canPush;
  late bool rememberLogin;
  late bool lowData;
  late bool backgroundMode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['canLoginWithBio'] = canLoginWithBio;
    map['canPush'] = canPush;
    map['rememberLogin'] = rememberLogin;
    map['lowData'] = lowData;
    map['backgroundMode'] = backgroundMode;
    return map;
  }
}
