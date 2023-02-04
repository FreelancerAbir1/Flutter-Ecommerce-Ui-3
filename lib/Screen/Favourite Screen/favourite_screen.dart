import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'component/body.dart';

class FavouriteScreen extends StatelessWidget {
  static const route = '/favourite';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(text: 'Favourite Items', context: context),
      body: Body(),
    );
  }

  AppBar buildAppbar({required text, required BuildContext context}) {
    return AppBar(
      title: Text(
        text,
        style: TextStyle(fontSize: 30.sp),
      ),
    );
  }
}
