import 'package:flutter/material.dart';

class ProductImagScreen extends StatelessWidget {
  final String img;
  const ProductImagScreen({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Image.network(
          img,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
