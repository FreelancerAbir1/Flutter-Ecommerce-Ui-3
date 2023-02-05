import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../Product Card/home_product_card.dart';
import '../../Top Product Details/details_screen.dart';

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
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            childAspectRatio: 0.7,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return HomeProductCard(
              snapshot: snapshot.data!.docs,
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
