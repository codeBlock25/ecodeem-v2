import 'package:ecodeem/logic/utils.dart';

class MessageField {
  MessageField._();
  static String createdAt = 'createdAt';
}

class Message {
  const Message({
    required this.idUser,
    required this.urlAvatar,
    required this.username,
    required this.message,
    required this.createdAt,
  });

  final String idUser;
  final String urlAvatar;
  final String username;
  final String message;
  final DateTime createdAt;

  Message fromJson(Map<String, dynamic> json) => Message(
        idUser: json['idUser'] as String,
        urlAvatar: json['urlAvatar'] as String,
        username: json['username'] as String,
        message: json['message'] as String,
        createdAt: Utils.toDateTime(json['createdAt'])!,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'idUser': idUser,
        'urlAvatar': urlAvatar,
        'username': username,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt),
      };
}
