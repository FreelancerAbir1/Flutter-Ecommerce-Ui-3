
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final String txt;
  final GestureTapCallback onPress;
  const SignUpButton({
    Key? key,
    required this.text,
    required this.txt,
   required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: kTextColor,
          ),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 20.sp,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}