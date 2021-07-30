/// level : 0
/// title : "NEWBIE"

class Reward {
  Reward({required this.level, required this.title});

  Reward.fromJson(dynamic json) {
    level = json['level'] as int;
    title = json['title'].toString();
  }

  late int level;
  late String title;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['level'] = level;
    map['title'] = title;
    return map;
  }
}
