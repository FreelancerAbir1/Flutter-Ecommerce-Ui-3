import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
