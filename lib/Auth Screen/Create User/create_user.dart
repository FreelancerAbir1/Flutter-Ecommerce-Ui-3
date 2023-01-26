import 'package:flutter/material.dart';

import '../../constant.dart';
import 'component/body.dart';

class CreateUser extends StatelessWidget {
  static const route = '/createuser';
  const CreateUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }
}
