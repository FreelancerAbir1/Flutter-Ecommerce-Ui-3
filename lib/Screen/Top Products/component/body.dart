import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 

import '../../../constant.dart';
import '../../Top Product Details/details_screen.dart';
import 'top_product_card.dart';

class Body extends StatelessWidget {
  final _usersStream = FirebaseFirestore.instance.collection('product-items');
  Body({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          flutterToast(text: 'Something went wrong');
          return const Text('Something went wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return TopProductCard(
              topProductSnapshot: snapshot.data!.docs,
              index: index,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                      index: index, snapShot: snapshot.data!.docs),
                ));
              },
            );
          },
        );
      },
    );
  }
}
