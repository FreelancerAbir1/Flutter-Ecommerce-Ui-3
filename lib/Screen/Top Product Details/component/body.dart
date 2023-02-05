import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';
import 'add_to_cart_btn.dart';
import 'headline_img.dart';
import 'product_des.dart';
import 'product_price.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.snapShot,
    required this.index,
  }) : super(key: key);

  final List snapShot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProductImagScreen(
            img: snapShot[index]['img'],
          ),
          ProductAndPriceName(snapShot: snapShot, index: index),
          const SizedBox(
            height: 10,
          ),
          ProductDesc(
            text: snapShot[index]['des'],
          ),
          const SizedBox(
            height: 10,
          ),
          AddToCartButton(
            text: 'Add to cart',
            onPress: () {
              addToCart(context);
            },
          ),
        ],
      ),
    );
  }

  //! Add to cart screen method here
  Future addToCart(context) async {
    final user = FirebaseFirestore.instance.collection('cart-items');

    return user
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('added-cart-items')
        .doc()
        .set({
      'des': snapShot[index]['des'],
      'id': snapShot[index]['id'],
      'img': snapShot[index]['img'],
      'price': snapShot[index]['price'],
      'name': snapShot[index]['name'],
    }).then((value) => flutterToast(text: 'Added to cart'));
  }
}
