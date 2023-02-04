import 'package:flutter/material.dart';

import 'component/body.dart';

class AccessoriesProduct extends StatelessWidget {
  static const route = '/accessoriesproduct';
  const AccessoriesProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessories Product'),
      ),
      body: Body(),
    );
  }
}
