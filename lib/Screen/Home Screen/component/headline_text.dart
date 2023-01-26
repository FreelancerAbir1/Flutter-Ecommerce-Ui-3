
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class HeadlineEcommerce extends StatelessWidget {
  final String text;
  const HeadlineEcommerce({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: kPrimaryColor, fontSize: 50.sp),
    );
  }
}