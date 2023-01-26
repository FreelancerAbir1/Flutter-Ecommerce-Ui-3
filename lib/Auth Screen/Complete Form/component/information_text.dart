import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class InformationText extends StatelessWidget {
  final String text;
  const InformationText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: kTextColor, fontSize: 16.sp),
    );
  }
}
