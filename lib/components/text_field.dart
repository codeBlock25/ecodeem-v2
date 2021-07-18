import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {required this.textController,
      required this.keyboardType,
      required this.validator,
      required this.label,
      this.autoComplete,
      this.maxLength,
      this.maxLine = 1,
      this.minLine,
      this.decoration,
      this.suffix,
      this.isHidden});
  final TextEditingController textController;
  final String label;
  final bool? isHidden;
  final Widget? suffix;
  final int? maxLength;
  final int maxLine;
  final int? minLine;
  final List<String>? autoComplete;
  final TextInputType keyboardType;
  final InputDecoration? decoration;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp)
              .copyWith(bottom: 5.sp, top: 8.sp),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp.clamp(14, 24),
            ),
          ),
        ),
        if (keyboardType == TextInputType.multiline)
          TextFormField(
              controller: textController,
              keyboardType: keyboardType,
              validator: validator,
              maxLength: maxLength,
              maxLines: maxLine,
              minLines: minLine,
              style: TextStyle(
                fontSize: 12.sp.clamp(12, 20),
              ),
              autofillHints: autoComplete,
              obscuringCharacter: '*',
              obscureText: isHidden ?? false,
              decoration: decoration)
        else
          SizedBox(
            height: 40.sp.clamp(40, 60),
            child: TextFormField(
                controller: textController,
                keyboardType: keyboardType,
                validator: validator,
                maxLength: maxLength,
                maxLines: maxLine,
                minLines: minLine,
                style: TextStyle(
                  fontSize: 12.sp.clamp(12, 20),
                ),
                autofillHints: autoComplete,
                obscuringCharacter: '*',
                obscureText: isHidden ?? false,
                decoration: decoration),
          ),
      ],
    );
  }
}
