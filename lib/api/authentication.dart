import 'package:dio/dio.dart';
import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/api/user_login_details.dart';
import 'package:ecodeem/config/api_config.dart';
import 'package:ecodeem/routes/page_route.dart';
import 'package:ecodeem/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

Future<void> registerUser(
    {required GlobalKey<FormState> formKey,
    required TextEditingController firstName,
    required TextEditingController lastName,
    required TextEditingController username,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController phoneNumber,
    required TextEditingController country,
    required TextEditingController state,
    required String interestID,
    required BuildContext context}) async {
  final Dio _dio = Dio();
  final GetStorage _box = GetStorage();
  if (formKey.currentState!.validate()) {
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
    await _dio.post('${Api.url}/user/signup', data: <String, dynamic>{
      'firstName': firstName.text,
      'lastName': lastName.text,
      'username': username.text,
      'email': email.text,
      'password': password.text,
      'phoneNumber': phoneNumber.text,
      'country': country.text,
      'state': state.text,
      'interest': interestID
    }).then((Response<dynamic> value) {
      Get.back();
      _box.write('isOld', true);
      const SnackBar snackBar = SnackBar(
        content: Text(
          'Your account has been been created successful, please provide to logging in.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Get.toNamed(AppPageRoute.authLogin);
    }).catchError((dynamic error) {
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
  }
}

Future<void> loginUser(
    {required GlobalKey<FormState> formKey,
    required TextEditingController email,
    required TextEditingController password,
    required BuildContext context}) async {
  final Dio _dio = Dio();
  final GetStorage _box = GetStorage();
  final ActiveUserController _activeUserController =
      Get.put(ActiveUserController());
  if (formKey.currentState!.validate()) {
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
    await _dio.post('${Api.url}/user/signin', data: <String, dynamic>{
      'email': email.text,
      'password': password.text,
    }).then((Response<dynamic> value) async {
      final Map<String, dynamic> _d = (value.data!['data']['user']
          as Map<String, dynamic>)
        ..addAll(<String, dynamic>{'token': value.data!['data']['token']});
      final ActiveUser _activeUser = ActiveUser.fromJson(_d);
      _activeUserController.user = _activeUser;
      final UserLoginDetails _userDetails =
          UserLoginDetails.fromJson(<String, dynamic>{
        'email': email.text,
        'password': password.text,
      });
      await _box.write('user', _userDetails.toJson());
      Get.back();
      const SnackBar snackBar = SnackBar(
        content: Text(
          'Welcome back!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Get.offAllNamed(AppPageRoute.home, arguments: <String, dynamic>{
        'userDetails': _activeUserController.user
      });
      // if (!_activeUser.isVerified) {
      //   Get.toNamed(AppPageRoute.verifyByEmail);
      // }
    }).catchError((dynamic error) {
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
  }
}

Future<void> resendVerificationCode(
    {required String? email, required BuildContext context}) async {
  final Dio _dio = Dio();
  final ActiveUserController _activeUserController =
      Get.put(ActiveUserController());
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
  await _dio.post('${Api.url}/user/resend-otp', data: <String, dynamic>{
    'email': email ?? (_activeUserController.user?.email ?? ''),
  }).then((Response<dynamic> value) {
    // final Map<String, dynamic> _d = (value.data!['data']['user']
    //     as Map<String, dynamic>)
    //   ..addAll(<String, dynamic>{'token': value.data!['data']['token']});
    // final ActiveUser _activeUser = ActiveUser.fromJson(_d);
    // _activeUserController.user = _activeUser;
    // Get.back();
    // if (!_activeUser.isVerified) {
    //   Get.toNamed(AppPageRoute.verifyByEmail);
    // }
  }).catchError((dynamic error) {
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
}
