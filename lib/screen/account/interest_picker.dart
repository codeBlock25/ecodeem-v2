import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/components/components.dart';
import 'package:ecodeem/routes/routes.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class InterestPickerPage extends StatefulWidget {
  const InterestPickerPage({Key? key}) : super(key: key);

  @override
  _InterestPickerPageState createState() => _InterestPickerPageState();
}

class _InterestPickerPageState extends State<InterestPickerPage> {
  int refreshInt = 0;
  final InterestController _interestController = Get.put(InterestController());
  late Future<List<Interest>> _listInterest;
  Future<void> load() async {
    _interestController.selected = null;
    setState(() {
      _listInterest = Interest.getInterests(context);
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppHeaderWithBackBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_interestController.selected == null) {
            Fluttertoast.showToast(
                msg: 'Please pick an interest.',
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey[100],
                textColor: Colors.black,
                fontSize: 10.sp);
          } else {
            Get.toNamed(AppPageRoute.authRegister);
          }
        },
        label: const Icon(UniconsLine.angle_right),
        icon: Text(
          'NEXT',
          style: TextStyle(fontSize: 12.sp, color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return load();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Column(
              children: <Widget>[
                Text(
                  'Sign up your account\nSelect your interested',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                FutureBuilder<List<Interest>>(
                  future: _listInterest,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Interest>> snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting ||
                        snapShot.connectionState == ConnectionState.none) {
                      return SizedBox(
                        width: 100.w,
                        height: 90.h - 100.sp,
                        child: Center(
                          child: SizedBox(
                            width: 30.sp,
                            height: 30.sp,
                            child: const CircularProgressIndicator(
                              color: primaryColor,
                              backgroundColor: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      );
                    } else if (snapShot.hasError) {
                      return Expanded(
                          child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Network Error!',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            TextButton(
                                onPressed: () {
                                  load();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.white.withOpacity(0.2))),
                                child: Text(
                                  'Retry',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.white),
                                ))
                          ],
                        ),
                      ));
                    } else if ((snapShot.data?.length ?? 0) <= 0 ||
                        snapShot.data!.isEmpty) {
                      return Expanded(
                          child: Center(
                        child: Text(
                          'No Interest available for selection.',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ));
                    }
                    return Expanded(
                        child: Wrap(
                      runSpacing: 20.sp,
                      spacing: 20.sp,
                      alignment: WrapAlignment.spaceBetween,
                      children: snapShot.data!.map((Interest e) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _interestController.selected = e;
                            });
                          },
                          child: SizedBox(
                            width: 100.sp,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 100.sp,
                                  height: 100.sp,
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.sp),
                                    color: _interestController.selected?.sId ==
                                            e.sId
                                        ? primaryColor.withOpacity(0.5)
                                        : Colors.grey[100],
                                  ),
                                  child: Image.network(
                                    e.image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.sp,
                                ),
                                Text(
                                  e.interest,
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
