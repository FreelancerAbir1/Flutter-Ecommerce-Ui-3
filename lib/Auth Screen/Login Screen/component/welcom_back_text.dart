import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class WelcomeBuddyText extends StatelessWidget {
  final String text;
  const WelcomeBuddyText({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 25.sp, fontWeight: FontWeight.bold, color: kPrimaryColor),
    );
  }
}
