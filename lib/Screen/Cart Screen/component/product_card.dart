import 'package:flutter/material.dart';

import '../../../constant.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
    required this.snapshot,
    required this.index,
    required this.onTap,
    this.onDismissed,
  }) : super(key: key);
  final List snapshot;
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
              snapshot[index]['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            leading: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                snapshot[index]['img'],
                scale: 1.0,
              ),
            ),
            trailing: Text(
              '${snapshot[index]['price']}৳',
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
