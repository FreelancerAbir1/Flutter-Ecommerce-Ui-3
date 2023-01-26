import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';

import 'component/body.dart';

class CompleteForm extends StatelessWidget {
  static const route = '/completeform';
  const CompleteForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTextLightColor,
      ),
      body: const Body(),
    );
  }
}
