/// email : 's'
/// password : 'dd'

class UserLoginDetails {
  UserLoginDetails({required this.email, required this.password});

  UserLoginDetails.fromJson(dynamic json) {
    email = json['email'].toString();
    password = json['password'].toString();
  }

  late String email;
  late String password;
  Map<String, dynamic> toJson() {
    final Map<String, String> map = <String, String>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
