import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../Top Product Details/details_screen.dart';
import 'product_card.dart';

class Body extends StatelessWidget {
  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: cartItemCollection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => ProductCard(
            snapShot: snapshot.data!.docs,
            index: index,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    index: index,
                    snapShot: snapshot.data!.docs,
                  ),
                ),
              );
            },
            onDismissed: (value) {
              cartItemDelete(
                  productId: snapshot.data!.docs[index].id, context: context);
            },
          ),
        );
      },
    );
  }

//! Cart item delete function
  Future<void> cartItemDelete({required productId, required context}) {
    return cartItemCollection
        .doc(
          productId,
        )
        .delete()
        .then((value) => flutterToast(text: 'Deleted Item'))
        .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Failed to delete user: $error"),
              ),
            ));
  }
}
