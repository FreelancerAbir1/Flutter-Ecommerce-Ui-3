import 'package:flutter/material.dart';

import '../../../constant.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.snapShot,
    required this.index,
    required this.onTap,
    this.onDismissed,
  }) : super(key: key);
  final List snapShot;
  final int index;
  final Function() onTap;
  final Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      key: UniqueKey(),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 10,
          shadowColor: kTextColor,
          child: ListTile(
            title: Text(
              snapShot[index]['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            leading: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                snapShot[index]['img'],
                scale: 1.0,
              ),
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
      ),
    );
  }
}
