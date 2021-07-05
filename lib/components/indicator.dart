import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/material.dart';



class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 7.5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          color: isActive ? primaryColor : const Color(0xFF5B5B5B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 3,
              color: isActive ? Colors.black : const Color(0xFF4B4B4B))),
    );
  }
}
