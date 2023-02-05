import 'package:flutter/material.dart';

import '../../../constant.dart';

class ProductAndPriceName extends StatelessWidget {
  const ProductAndPriceName({
    Key? key,
    required this.snapShot,
    required this.index,
  }) : super(key: key);

  final List snapShot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kTextLightColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            snapShot[index]['name'],
            style: TextStyle(
              fontSize: 24,
              fontWeight: kDefaultFontBold.fontWeight,
              color: kTextColor,
            ),
          ),
          Text(
            '${snapShot[index]['price']}৳',
            style: TextStyle(
              fontSize: 24,
              fontWeight: kDefaultFontBold.fontWeight,
              color: kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
