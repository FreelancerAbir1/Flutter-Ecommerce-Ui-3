import 'package:flutter/material.dart';

import '../../../constant.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.onTap,
    required this.snapShot,
    required this.index,
  }) : super(key: key);
  final Function() onTap;
  final List snapShot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shadowColor: kTextColor,
        child: ListTile(
          title: Center(
            child: Text(
              snapShot[index]['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
          ),
          leading: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(
              snapShot[index]['img'],
              scale: 1.0,
            ),
          ),
          subtitle: const Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),
          trailing: Text(
            '${snapShot[index]['price']}৳',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
