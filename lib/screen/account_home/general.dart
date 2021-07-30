import 'package:ecodeem/components/components.dart';
import 'package:ecodeem/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class GeneralPageView extends StatefulWidget {
  const GeneralPageView({Key? key}) : super(key: key);

  @override
  _GeneralPageViewState createState() => _GeneralPageViewState();
}

class _GeneralPageViewState extends State<GeneralPageView> {
  GenSettings? _genSettings;
  final GetStorage _box = GetStorage();
  Future<void> loadGenSetting() async {
    final GenSettings genSettings = GenSettings.fromJson(
        await _box.read('gen_settings') as Map<String, dynamic>);
    setState(() {
      _genSettings = genSettings;
    });
  }

  @override
  void initState() {
    super.initState();
    loadGenSetting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppHeaderWithBackBtnAndText('General'),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: <Widget>[
            SwitchListTile(
              value: _genSettings?.canLoginWithBio ?? false,
              onChanged: (bool newValue) {
                setState(() => <void>{
                      _genSettings?.canLoginWithBio =
                          _genSettings?.canLoginWithBio ?? false
                    });
              },
              title: Text(
                'Allow bio-metric login'.capitalize!,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            SwitchListTile(
              value: _genSettings?.canPush ?? false,
              onChanged: (bool newValue) {
                setState(() => <void>{
                      _genSettings?.canPush = _genSettings?.canPush ?? false
                    });
              },
              title: Text(
                'Allow push notification'.capitalize!,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            SwitchListTile(
              value: _genSettings?.rememberLogin ?? false,
              onChanged: (bool newValue) {
                setState(() => <void>{
                      _genSettings?.rememberLogin =
                          _genSettings?.rememberLogin ?? false
                    });
              },
              title: Text(
                'Remember Login'.capitalize!,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            SwitchListTile(
              value: _genSettings?.lowData ?? false,
              onChanged: (bool newValue) {
                setState(() => <void>{
                      _genSettings?.lowData = _genSettings?.lowData ?? false
                    });
              },
              title: Text(
                'Low data usage'.capitalize!,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            SwitchListTile(
              value: _genSettings?.backgroundMode ?? false,
              onChanged: (bool newValue) {
                setState(() => <void>{
                      _genSettings?.backgroundMode =
                          _genSettings?.backgroundMode ?? false
                    });
              },
              title: Text(
                'Allow background mode'.capitalize!,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            ListTile(
              title: Text(
                'clear app records'.capitalize!,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
