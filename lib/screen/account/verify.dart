import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/components/components.dart';
import 'package:ecodeem/styles/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sizer/sizer.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController pinInputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _pinPutFocusNode = FocusNode();
  String email = '';

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: const Color(0xffF5F5f5),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: const Color(0xffD9D9D9).withOpacity(0.38),
            blurRadius: 12.sp,
            offset: Offset(0, 8.sp))
      ],
      borderRadius: BorderRadius.circular(100),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      email = Get.arguments['email'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets _padding = MediaQuery.of(context).padding;
    return Scaffold(
      appBar: buildAppHeaderWithBackBtn(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.sp,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.sp),
                  child: Text(
                    'Verify Your Account'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xff5A5A5A),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.sp)
                      .copyWith(top: 20.sp),
                  child: Text(
                    'We have sent the code verification to Your Email Address \n$email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xff5A5A5A),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 4,
              ),
              Center(
                child: Text(
                  'Enter Your One time \nVerification Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 25.sp.clamp(20, 50),
                    vertical: 20.sp.clamp(20, 40)),
                child: Form(
                  key: _formKey,
                  child: PinPut(
                    fieldsCount: 6,
                    focusNode: _pinPutFocusNode,
                    controller: pinInputController,
                    onChanged: (String? val) {
                      if (val == null) return;
                      setState(() {});
                    },
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    inputDecoration: const InputDecoration(
                      fillColor: Colors.transparent,
                    ),
                    onClipboardFound: (String? clip) {
                      if (clip != null) {
                        if (clip.isNumericOnly) {
                          pinInputController.text = clip.substring(0, 6);
                        }
                      }
                    },
                    textStyle:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.sp.clamp(20, 40)),
                  child: IgnorePointer(
                    ignoring: pinInputController.text.length <= 5,
                    child: Opacity(
                      opacity: pinInputController.text.length <= 5 ? 0.4 : 1,
                      child: TextButton(
                        onPressed: () {
                          verifyAccount(
                              email: Get.arguments!['email'].toString(),
                              verificationCode: pinInputController,
                              context: context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.sp),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(Size(250.sp, 40.sp)),
                        ),
                        child: Text(
                          'Verify'.toUpperCase(),
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Didn't receive your code?",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Resend Code',
                            style: const TextStyle(color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                resendVerificationCode(
                                    email: Get.arguments?['email'].toString(),
                                    context: context);
                              })
                      ]),
                ),
              ),
              SizedBox(
                height: _padding.bottom + 5.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
