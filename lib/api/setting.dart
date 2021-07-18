/// canLoginWithBio : false
/// canPush : false
/// rememberLogin : false
/// lowData : false
/// backgroundMode : false

class Settings {
  Settings(
      {this.canLoginWithBio,
      this.canPush,
      this.rememberLogin,
      this.lowData,
      this.backgroundMode});

  Settings.fromJson(dynamic json) {
    canLoginWithBio = json['canLoginWithBio'] as bool?;
    canPush = json['canPush'] as bool?;
    rememberLogin = json['rememberLogin'] as bool?;
    lowData = json['lowData'] as bool?;
    backgroundMode = json['backgroundMode'] as bool?;
  }

  bool? canLoginWithBio;
  bool? canPush;
  bool? rememberLogin;
  bool? lowData;
  bool? backgroundMode;

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
