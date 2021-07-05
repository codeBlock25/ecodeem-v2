import 'package:ecodeem/screen/account/forgot_password.dart';
import 'package:ecodeem/screen/account/index.dart';
import 'package:ecodeem/screen/account/interest_picker.dart';
import 'package:ecodeem/screen/account/login.dart';
import 'package:ecodeem/screen/account/register.dart';
import 'package:ecodeem/screen/account/verify.dart';
import 'package:ecodeem/screen/account_home/account_home.dart';
import 'package:ecodeem/screen/account_home/setting.dart';
import 'package:ecodeem/screen/home/app.dart';
import 'package:ecodeem/screen/launch/activity_picker.dart';
import 'package:ecodeem/screen/launch/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPageRoute {
  AppPageRoute._();
  static String init = '/';
  static String activity = '/activity';
  static String account = '/auth';
  static String login = '/login';
  static String register = '/register';
  static String forgetPassword = '/forgot-password';
  static String authLogin = '/auth/login';
  static String authRegister = '/auth/register';
  static String authForgotPassword = '/auth/forgot-password';
  static String home = '/home';
  static String interest = '/interest';
  static String verifyByEmail = '/auth/verify';
  static String accountGeneralView = '/account/settings/general';
  static String accountSettingView = '/account/settings';

  static List<GetPage<GetPageRoute<Widget>>> pages =
      <GetPage<GetPageRoute<Widget>>>[
    GetPage<GetPageRoute<WelcomeScreen>>(
        name: AppPageRoute.init, page: () => const WelcomeScreen()),
    GetPage<GetPageRoute<WelcomeScreen>>(
        name: AppPageRoute.interest, page: () => const InterestPickerPage()),
    GetPage<GetPageRoute<WelcomeScreen>>(
        name: AppPageRoute.accountGeneralView,
        page: () => const GeneralPageView()),
    GetPage<GetPageRoute<Widget>>(
        name: AppPageRoute.accountSettingView, page: () => const AccountHome()),
    GetPage<GetPageRoute<ActivityPickerScreen>>(
        name: AppPageRoute.activity,
        page: () => const ActivityPickerScreen(),
        transition: Transition.rightToLeft),
    GetPage<GetPageRoute<AppHomeBuilder>>(
        name: AppPageRoute.home, page: () => const AppHomeBuilder()),
    GetPage<GetPageRoute<AuthPage>>(
        name: AppPageRoute.account,
        page: () => const AuthPage(),
        children: <GetPage<GetPageRoute<Widget>>>[
          GetPage<GetPageRoute<LoginPage>>(
              name: AppPageRoute.verifyByEmail.replaceFirst('/auth', ''),
              page: () => const VerificationPage()),
          GetPage<GetPageRoute<LoginPage>>(
              name: AppPageRoute.login, page: () => const LoginPage()),
          GetPage<GetPageRoute<RegisterPage>>(
              name: AppPageRoute.register, page: () => const RegisterPage()),
          GetPage<GetPageRoute<ForgotPasswordPage>>(
              name: AppPageRoute.forgetPassword,
              page: () => const ForgotPasswordPage()),
        ])
  ];
}
