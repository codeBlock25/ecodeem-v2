import 'package:dio/dio.dart';
import 'package:ecodeem/config/config.dart';
import 'package:ecodeem/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class Interest {
  Interest(
      {required this.sId,
      required this.interest,
      required this.image,
      required this.createdAt,
      required this.updatedAt,
      required this.iV});

  Interest.fromJson(dynamic json) {
    sId = json['_id'].toString();
    interest = json['interest'].toString();
    image = json['image'].toString();
    createdAt = json['createdAt'].toString().toDate();
    updatedAt = json['updatedAt'].toString().toDate();
    iV = json['__v'] as int;
  }

  late String sId;
  late String interest;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int iV;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['interest'] = interest;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }

  static Future<List<Interest>> getInterests(BuildContext context) async {
    final Dio _dio = Dio();
    final List<Interest> _data = <Interest>[];
    await _dio
        .get('${Api.url}/interest/user-all')
        .then((Response<dynamic> value) {
      final List<dynamic> d =
          value.data?['data']['interests'] as List<dynamic>? ?? <dynamic>[];
      for (final dynamic e in d) {
        _data.add(Interest.fromJson(e as Map<String, dynamic>));
      }
    }).catchError((dynamic error) {
      if (error.runtimeType == DioError) {
        final DioError err = error as DioError;
        final SnackBar snackBar = SnackBar(
          content: Text(
            (err.response?.data['message'] ??
                    'Sorry we could not connect to base, please try again with better internet connection')
                .toString(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        throw Error();
      }
      const SnackBar snackBar = SnackBar(
        content: Text(
          'Sorry we could not connect to base, please try again with better internet connection',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      throw Error();
    });
    return _data;
  }
}

class InterestController extends GetxController {
  Interest? selectedInterest;
  List<Interest>? interest;

  Interest? get selected {
    return selectedInterest;
  }

  void addToInterests(Interest newInterest) {
    if (interest == null) {
      return;
    } else if (interest!
        .where((Interest element) => element.interest == newInterest.interest)
        .isEmpty) {
      interest!.add(newInterest);
    }
  }

  set selected(Interest? data) {
    selectedInterest = data;
  }

  List<Interest>? get availableInterest {
    return interest;
  }

  set availableInterest(List<Interest>? data) {
    interest = data;
  }
}

