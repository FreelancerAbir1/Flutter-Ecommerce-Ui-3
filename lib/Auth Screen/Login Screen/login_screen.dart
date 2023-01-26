import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';

import 'component/body.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/loginscreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }
}
