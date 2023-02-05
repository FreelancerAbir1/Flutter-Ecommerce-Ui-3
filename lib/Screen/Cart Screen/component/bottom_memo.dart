import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'continue_btn.dart';
import 'price_and_items.dart';

class BottomMemo extends StatelessWidget {
  const BottomMemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: cartItemCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const SizedBox(height: 150, child: Text('Something error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 150,
              child: Text('Loading..'),
            );
          }
          return Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: kTextColor.withAlpha(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TotalPriceAndItems(
                  totalItems: snapshot.data!.docs.isEmpty
                      ? 'Total Items: 0'
                      : 'Total Items: ${snapshot.data!.docs.length}',
                  toaltPrice: 'Total Price:  200',
                ),
                ContinueButton(
                  text: 'Continue',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        });
  }
}
