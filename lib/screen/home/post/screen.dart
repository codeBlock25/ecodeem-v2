import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecodeem/api/api.dart';
import 'package:ecodeem/api/interests.dart';
import 'package:ecodeem/api/post.dart';
import 'package:ecodeem/components/components.dart';
import 'package:ecodeem/config/config.dart';
import 'package:ecodeem/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import 'package:video_player/video_player.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key, required this.controller}) : super(key: key);

  final PersistentTabController controller;
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen>
    with SingleTickerProviderStateMixin {
  bool isNormalPost = true;
  final TextEditingController _postTextController = TextEditingController();
  final TextEditingController _minTextController = TextEditingController();
  final TextEditingController _maxTextController = TextEditingController();
  final CurrentUser _activeUser = Get.arguments['userDetails'] as CurrentUser;
  bool isImage = true;
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  XFile? videoFile;
  bool isPlaying = false;

  late VideoPlayerController? _videoPlayerController;

  Future<void> getImage() async {
    try {
      final XFile? _image =
          await _picker.pickImage(source: ImageSource.gallery);
      if (_image == null) return;
      setState(() {
        isImage = true;
        imageFile = _image;
      });
    } catch (e) {
      final SnackBar snackBar = SnackBar(
        content: Text(
          e.toString(),
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> getVideo() async {
    final XFile? _video = await _picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(seconds: 60));
    if (_video == null) return;
    setState(() {
      isImage = false;
      videoFile = _video;
    });
    _videoPlayerController = VideoPlayerController.file(File(_video.path))
      ..initialize().then((_) {
        setState(() {});
        _pausePlayController.forward();
      });
    _videoPlayerController!.addListener(() {
      final VideoPlayerValue value = _videoPlayerController!.value;
      if (value.isPlaying) {
        _pausePlayController.reverse();
      } else {
        _pausePlayController.forward();
      }
    });
  }

  Future<List<dynamic>>? interests;
  Interest? selectInterests;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final InterestController _interestController = Get.put(InterestController());
  final Dio _dio = Dio();
  Future<List<dynamic>> loadInterests() async {
    List<dynamic> _interests = <dynamic>[];
    final CurrentUser _activeUser = Get.arguments['userDetails'] as CurrentUser;
    await _dio
        .get('${Api.url}/interest/user-all',
            options: Options(headers: <String, dynamic>{
              'authorization': 'Bearer ${_activeUser.token}'
            }))
        .then((Response<dynamic> value) {
      _interests =
          value.data['data']['interests'] as List<dynamic>? ?? <dynamic>[];
    }).catchError((dynamic error) {
      if (error.runtimeType == DioError) {
        final DioError err = error as DioError;
        final SnackBar snackBar = SnackBar(
          content: Text(
            err.response?.data['message'].toString() ?? 'Network Error',
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
    return _interests;
  }

  late AnimationController _pausePlayController;
  @override
  void initState() {
    super.initState();
    setState(() {
      interests = loadInterests();
      _pausePlayController = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 450));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Post',
          style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: 100.w,
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100.w,
                    height: 45,
                    margin:
                        EdgeInsets.only(top: 30.sp, left: 10.sp, right: 10.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color(0x334f7b1e),
                          blurRadius: 30,
                        ),
                      ],
                      color: const Color(0xfff4ffe8),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate,
                          left: !isNormalPost ? 43.w : 0,
                          top: 0,
                          child: Container(
                            width: 43.w,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff0f0f0f),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isNormalPost = true;
                                });
                              },
                              child: Container(
                                width: 43.w,
                                height: 45,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      UniconsLine.shop,
                                      color: isNormalPost
                                          ? Colors.white
                                          : const Color(0xff818181),
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Shops',
                                      style: TextStyle(
                                        color: isNormalPost
                                            ? const Color(0xff8cc64b)
                                            : const Color(0xff818181),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isNormalPost = false;
                                });
                              },
                              child: Container(
                                width: 43.w,
                                height: 45,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(UniconsLine.presentation_line,
                                        color: !isNormalPost
                                            ? Colors.white
                                            : const Color(0xff818181),
                                        size: 20),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Campaigns',
                                      style: TextStyle(
                                        color: !isNormalPost
                                            ? const Color(0xff8cc64b)
                                            : const Color(0xff818181),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Text(
                    'Select Interest',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder<dynamic>(
                      future: interests,
                      builder: (BuildContext content,
                          AsyncSnapshot<Object?> snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox();
                        } else if (snapShot.hasError) {
                          return const SizedBox();
                        } else {
                          final List<dynamic>? rawData =
                              snapShot.data as List<dynamic>?;
                          return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ...rawData!.map((dynamic interestRaw) {
                                  final Interest _interest =
                                      interestRaw.runtimeType == Interest
                                          ? interestRaw as Interest
                                          : Interest.fromJson(interestRaw);
                                  _interestController.addToInterests(_interest);
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectInterests = _interest;
                                      });
                                    },
                                    child: Container(
                                      width: 130.sp,
                                      padding: const EdgeInsets.all(10),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 45.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.sp),
                                                color: const Color(0xffeaece7),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      _interest.image,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Positioned.fill(
                                              child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.sp),
                                              color:
                                                  selectInterests?.interest ==
                                                          _interest.interest
                                                      ? primaryColor
                                                      : Colors.black
                                                          .withOpacity(0.6),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              _interest.interest,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp.clamp(15, 25),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ]);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  TextFieldWidget(
                    textController: _postTextController,
                    keyboardType: TextInputType.multiline,
                    validator: (String? val) {
                      if (val == null) {
                        return "This field can't be empty";
                      } else if (val.isEmpty) {
                        return "This field can't be empty";
                      } else {
                        return null;
                      }
                    },
                    minLine: 6, //(30.h / 14.sp).ceil(),
                    maxLine: 8, //(30.h / 14.sp).ceil() + 2,
                    maxLength: 2000,
                    label: 'Content',
                    decoration: InputDecoration(
                        hintText:
                            "What's on your mind? @${_activeUser.username}"),
                  ),
                  if (imageFile != null && isImage)
                    SizedBox(
                      width: 100.w,
                      height: 120.w.clamp(300, 600),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 100.w,
                            height: 120.w.clamp(300, 600),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10.sp.clamp(10, 30)),
                              image: DecorationImage(
                                  image: FileImage(File(imageFile!.path)),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                              top: 10.sp.clamp(10, 40),
                              right: 10.sp.clamp(10, 40),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.sp),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          blurRadius: 25.sp,
                                          color: Colors.black.withOpacity(0.4))
                                    ]),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      imageFile = null;
                                      videoFile = null;
                                      isImage = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 24.sp.clamp(20, 40),
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 10.sp.clamp(10, 20),
                  ),
                  if (videoFile != null && isImage == false)
                    _videoPlayerController!.value.isInitialized
                        ? SizedBox(
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10.sp.clamp(10, 20)),
                                  child: AspectRatio(
                                    aspectRatio: _videoPlayerController!
                                        .value.aspectRatio,
                                    child: VideoPlayer(_videoPlayerController!),
                                  ),
                                ),
                                Positioned.fill(
                                    child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (isPlaying) {
                                        _videoPlayerController!.pause();
                                      } else {
                                        _videoPlayerController!.play();
                                      }
                                      setState(() {
                                        isPlaying = !isPlaying;
                                      });
                                    },
                                    child: AnimatedIcon(
                                      progress: _pausePlayController,
                                      icon: AnimatedIcons.pause_play,
                                      color: Colors.white,
                                      size: 50.sp.clamp(30, 100),
                                    ),
                                  ),
                                )),
                                Positioned(
                                    top: 10.sp.clamp(10, 40),
                                    right: 10.sp.clamp(10, 40),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.sp),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                blurRadius: 25.sp,
                                                color: Colors.black
                                                    .withOpacity(0.4))
                                          ]),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            imageFile = null;
                                            videoFile = null;
                                            isImage = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          size: 24.sp.clamp(20, 40),
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: 100.w,
                            height: 120.w.clamp(300, 600),
                          ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  if (!isNormalPost)
                    SizedBox(
                      height: 75.sp,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Fund\nTarget:',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    height: 120.sp,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFieldWidget(
                                            textController: _minTextController,
                                            keyboardType: TextInputType.number,
                                            validator: (String? val) {
                                              if (val == null) {
                                                return "This field can't be empty";
                                              } else if (val.isNotEmpty) {
                                                return "This field can't be empty";
                                              }
                                              if (val.isNumericOnly) {
                                                return 'Must be numbers only';
                                              }
                                              return null;
                                            },
                                            label: 'MIN',
                                            decoration: const InputDecoration(
                                                hintText: '0.00'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.sp,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 120.sp,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFieldWidget(
                                            textController: _maxTextController,
                                            keyboardType: TextInputType.number,
                                            validator: (String? val) {
                                              if (val == null) {
                                                return "This field can't be empty";
                                              } else if (val.isNotEmpty) {
                                                return "This field can't be empty";
                                              }
                                              if (val.isNumericOnly) {
                                                return 'Must be numbers only';
                                              }
                                              return null;
                                            },
                                            label: 'MAX',
                                            decoration: const InputDecoration(
                                                hintText: '0.00'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    const SizedBox(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.sp),
                        child: Text(
                          'Attach:',
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: Container(
                                width: 70.sp,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.sp, vertical: 5.sp),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.sp, vertical: 5.sp),
                                decoration: BoxDecoration(
                                    color: imageFile != null && isImage
                                        ? primaryColor
                                        : Colors.green[50],
                                    borderRadius: BorderRadius.circular(5.sp)),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.sp),
                                      child: const Icon(
                                        UniconsLine.image,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      'Photo',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                getVideo();
                              },
                              child: Container(
                                width: 70.sp,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.sp, vertical: 5.sp),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.sp, vertical: 5.sp),
                                decoration: BoxDecoration(
                                    color: videoFile != null && isImage == false
                                        ? primaryColor
                                        : Colors.green[50],
                                    borderRadius: BorderRadius.circular(5.sp)),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.sp),
                                      child: const Icon(
                                        UniconsLine.video,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Text(
                                      'Video',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 70.sp,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp, vertical: 5.sp),
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(5.sp)),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.sp),
                                    child: const Icon(
                                      UniconsLine.tv_retro,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Text(
                                    'Live',
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 70.sp,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp, vertical: 5.sp),
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(5.sp)),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.sp),
                                    child: const Icon(
                                      UniconsLine.notes,
                                      color: Colors.purple,
                                    ),
                                  ),
                                  Text(
                                    'Story',
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          uploadPost(
                                  formKey: _formKey,
                                  postDesc: _postTextController,
                                  interest: selectInterests,
                                  activeUser: _activeUser,
                                  controller: widget.controller,
                                  file: isImage && imageFile != null
                                      ? imageFile
                                      : videoFile,
                                  postType: isImage && imageFile != null
                                      ? PostType.image
                                      : !isImage && videoFile != null
                                          ? PostType.video
                                          : PostType.text,
                                  context: context)
                              .then((dynamic value) => {
                                    setState(() {
                                      isImage = false;
                                      imageFile = null;
                                      videoFile = null;
                                      selectInterests = null;
                                    })
                                  });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            overlayColor: MaterialStateProperty.all(
                                Colors.white.withOpacity(0.1)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                                Size(min(100.w / 1.656, 500), 50))),
                        child: Text(
                          'POST',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
