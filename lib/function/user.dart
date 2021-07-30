import 'package:dio/dio.dart';
import 'package:ecodeem/config/config.dart';
import 'package:ecodeem/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';

Future<Map<String, dynamic>?> getUserProfileRecords(
    {required CurrentUser user, required BuildContext context}) async {
  Map<String, dynamic>? data;
  final Dio _dio = Dio();
  final GetStorage _box = GetStorage();
  _dio
      .get(
    '${Api.url}/user/profile/${user.id}',
  )
      .then((Response<dynamic> value) {
    _box.write('profileDetails', value.data!['data']);
    data = value.data!['data'] as Map<String, dynamic>;
  }).catchError((dynamic error) async {
    Get.back();
    if (error.runtimeType == DioError) {
      final DioError err = error as DioError;
      final SnackBar snackBar = SnackBar(
        content: Text(
          err.response!.data['message'].toString(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    const SnackBar snackBar = SnackBar(
      content: Text(
        'Network Error',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
  return data;
}
