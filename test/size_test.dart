import 'package:ecodeem/logic/size.dart';
import 'package:ecodeem/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('The width when in portia mode should be same as', () {
    final double width =
        trueWidth(MediaQuery.of(const WelcomeScreen().createElement()));

    expect(width,
        MediaQuery.of(const WelcomeScreen().createElement()).size.shortestSide);
  });
}
