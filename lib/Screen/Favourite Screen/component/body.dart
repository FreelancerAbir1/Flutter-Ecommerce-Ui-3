import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 import '../../Top Product Details/details_screen.dart';
import 'product_card.dart';

class Body extends StatelessWidget {
  final favCollection = FirebaseFirestore.instance
      .collection('cart-items')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('favourite-items');

    Body({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: favCollection.snapshots(),
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
              index: index,
              snapShot: snapshot.data!.docs,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    index: index,
                    snapShot: snapshot.data!.docs,
                  ),
                ));
              },
            ),
          );
        });
  }
}
