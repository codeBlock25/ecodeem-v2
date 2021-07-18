import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget buildLineDec({required double length}) {
  return Container(
    width: length,
    height: 5.sp.clamp(5, 10),
    decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.sp.clamp(10, 20))),
    margin: EdgeInsets.symmetric(
        horizontal: 15.sp.clamp(15, 30), vertical: 1.sp.clamp(2, 5)),
  );
}
