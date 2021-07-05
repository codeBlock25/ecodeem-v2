import 'package:flutter/material.dart';

double trueWidth (MediaQueryData  deviceMediaQuery){
  final double width = deviceMediaQuery.size.width < deviceMediaQuery.size.height? deviceMediaQuery.size.shortestSide: deviceMediaQuery.orientation == Orientation.portrait ? deviceMediaQuery.size.shortestSide : deviceMediaQuery.size.width;
  return width;
}