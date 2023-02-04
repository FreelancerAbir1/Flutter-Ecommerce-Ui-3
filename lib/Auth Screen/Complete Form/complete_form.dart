import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';

import 'component/body.dart';

class CompleteForm extends StatelessWidget {
  static const route = '/completeform';
  const CompleteForm({Key? key, required this.email, required this.password})
      : super(key: key);

  final TextEditingController email;
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTextLightColor,
      ),
      body: Body(email: email,password: password,),
    );
  }
}
