import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final String txt;
  final GestureTapCallback onPress;
  const SignInButton({
    Key? key,
    required this.text,
    required this.txt,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: kTextColor,
            ),
          ),
          Text(
            txt,
            style: TextStyle(
              fontSize: 20.sp,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
