import 'package:ecodeem/logic/utils.dart';

class UserField {
  final String lastMessageTime = 'lastMessageTime';
}

class User {
  const User({
    this.idUser,
    required this.name,
    required this.urlAvatar,
    required this.lastMessageTime,
  });

  final String? idUser;
  final String name;
  final String urlAvatar;
  final DateTime lastMessageTime;

  User copyWith({
    required String idUser,
    required String name,
    required String urlAvatar,
    required String lastMessageTime,
  }) =>
      User(
        idUser: idUser,
        name: name,
        urlAvatar: urlAvatar,
        lastMessageTime: this.lastMessageTime,
      );

  User fromJson(Map<String, dynamic> json) => User(
        idUser: json['idUser'] as String,
        name: json['name'] as String,
        urlAvatar: json['urlAvatar'] as String,
        lastMessageTime: Utils.toDateTime(json['lastMessageTime'])!,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
      };
}
