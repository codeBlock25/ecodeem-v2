import 'package:dio/dio.dart';
import 'package:ecodeem/api/api.dart';
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
    required List<String> interestID,
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
      'firstName': firstName.text.trim(),
      'lastName': lastName.text.trim(),
      'username': username.text.trim(),
      'email': email.text.trim(),
      'password': password.text.trim(),
      'phoneNumber': phoneNumber.text.trim(),
      'country': country.text.trim(),
      'state': state.text.trim(),
      'interests': interestID,
      'bio': 'Hi, I am a user of Ecodeem'
    }).then((Response<dynamic> value) {
      Get.back();
      _box.write('isOld', true);
      const SnackBar snackBar = SnackBar(
        content: Text(
          'Your account has been created successful, please proceed to verify your account.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      formKey.currentState!.save();
      Get.toNamed(AppPageRoute.verifyByEmail,
          arguments: <String, String>{'email': email.text.trim()});
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
      'email': email.text.trim(),
      'password': password.text.trim(),
    }).then((Response<dynamic> value) async {
      final Map<String, dynamic> _d = (value.data!['data']['user']
          as Map<String, dynamic>)
        ..addAll(<String, dynamic>{'token': value.data!['data']['token']});
      final CurrentUser _activeUser = CurrentUser.fromJson(_d);
      _activeUserController.currentUser = _activeUser;
      final UserLoginDetails _userDetails =
          UserLoginDetails.fromJson(<String, dynamic>{
        'email': email.text.trim(),
        'password': password.text.trim(),
      });
      await _box.write('user', _userDetails.toJson());
      Get.back();
      final SnackBar snackBar = SnackBar(
        content: Text(
          'Welcome back ${_activeUser.username}!',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      formKey.currentState!.save();
      Get.offAllNamed(AppPageRoute.home, arguments: <String, dynamic>{
        'userDetails': _activeUserController.user
      });
    }).catchError((dynamic error) async {
      Get.back();
      if (error.runtimeType == DioError) {
        final DioError err = error as DioError;
        if (err.response!.data['message']
            .toString()
            .contains('not yet being')) {
          await resendVerificationCode(
              email: email.text.trim(), context: context);
          Get.toNamed(AppPageRoute.verifyByEmail,
              arguments: <String, String>{'email': email.text.trim()});
        }
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
    Get.back();
    const SnackBar snackBar = SnackBar(
      content: Text(
        'Your request has been made and your one time code has been sent to your mail.',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: primaryColor,
      duration: Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

Future<void> verifyAccount(
    {required String email,
    required TextEditingController verificationCode,
    required BuildContext context}) async {
  final Dio _dio = Dio();
  final GetStorage _box = GetStorage();
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
  await _dio.post('${Api.url}/user/verify', data: <String, dynamic>{
    'email': email,
    'confirmCode': verificationCode.text
  }).then((Response<dynamic> value) {
    _box.write('isOld', true);
    const SnackBar snackBar = SnackBar(
      content: Text(
        'Your account has been verified successful, please proceed to login your account.',
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
