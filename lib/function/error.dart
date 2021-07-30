import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void displayError(dynamic error, BuildContext context) {
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
}
