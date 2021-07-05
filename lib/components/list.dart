import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class ListItemView extends StatelessWidget {
  const ListItemView({
    Key? key,
    required this.icon,
    required this.title,
    required this.func,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: func,
      leading: Icon(
        icon,
        color: const Color(0xff000000),
        size: 18.sp,
      ),
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        UniconsLine.angle_right,
        color: const Color(0xffAFAFAF),
        size: 20.sp,
      ),
    );
  }
}
