import 'package:flutter/material.dart';

import 'component/body.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

