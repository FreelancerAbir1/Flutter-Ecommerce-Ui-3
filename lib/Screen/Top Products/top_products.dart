 import 'package:flutter/material.dart';

import 'component/body.dart';
 
class TopProducts extends StatelessWidget {
  static const route = '/topproduct';
  const TopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Product'),
      ),
      body: Body(),
    );
  }
}
