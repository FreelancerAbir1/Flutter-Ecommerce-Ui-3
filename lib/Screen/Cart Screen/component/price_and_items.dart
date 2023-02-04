
import 'package:flutter/material.dart';

import '../../../constant.dart';

class TotalPriceAndItems extends StatelessWidget {
  const TotalPriceAndItems({
    Key? key,
    required this.totalItems,
    required this.toaltPrice,
  }) : super(key: key);
  final String totalItems;
  final String toaltPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          totalItems,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
        Text(
          toaltPrice,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}