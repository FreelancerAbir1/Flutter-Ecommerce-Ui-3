import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'component/body.dart';
import 'component/bottom_memo.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomMemo(),
      appBar: buildAppbar(text: 'Cart Screen', context: context),
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
