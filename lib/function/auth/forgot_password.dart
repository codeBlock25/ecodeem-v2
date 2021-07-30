import 'package:dio/dio.dart';
import 'package:ecodeem/config/config.dart';
import 'package:ecodeem/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:sizer/sizer.dart';

Future<Response<dynamic>> requestPasswordReset(
    {required String email, required BuildContext context}) async {
  final Dio _dio = Dio();
  Get.defaultDialog(
      title: 'Loading...',
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titleStyle: TextStyle(fontSize: 14.sp, color: primaryColor),
      content: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 3,
        ),
      ));
  return _dio.post('${Api.url}/user/recover_password', data: <String, String>{
    'email': email,
    'passResetLink': 'https://ecodeem.com/auth/forgot-password'
  });
}
