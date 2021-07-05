import 'package:flutter/foundation.dart';

class Api {
  Api._();
  static String liveServer = 'https://ecodeem-auth-dev.herokuapp.com/api/v1';
  static String localServer = 'https://ecodeem-auth-dev.herokuapp.com/api/v1';
  static String origin = 'mobile/team_manager';
  static bool isDev = kDebugMode || kProfileMode;
  static String url = isDev ? localServer : liveServer;
}
