import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constant.dart';
import 'component/body.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.index, required this.snapShot})
      : super(key: key);
  static const route = '/topdetailsscreen';
  final int index;
  final List snapShot;

  final cartFavCollection = FirebaseFirestore.instance
      .collection('cart-items')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('favourite-items');
  Future addFavouriteItem() async {
    return cartFavCollection.doc().set(
      {
        'name': snapShot[index]['name'],
        'id': snapShot[index]['id'],
        'price': snapShot[index]['price'],
        'des': snapShot[index]['des'],
        'img': snapShot[index]['img'],
      },
    ).then(
      (value) => flutterToast(text: 'Item added'),
    );
  }

  Future deleteFavouriteItem({required id}) async {
    return cartFavCollection.doc(id).delete().then(
          (value) => flutterToast(text: 'Item delete'),
        );
  }

//! Flutter toast here
  flutterToast({required text}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kPrimaryColor,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kTextLightColor,
              ),
            ),
          ),
        ),
        actions: [
          StreamBuilder<QuerySnapshot>(
            stream: cartFavCollection
                .where(
                  'des',
                  isEqualTo: snapShot[index]['des'],
                )
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
              if (snapshots.hasError) {
                flutterToast(text: 'Something went wrong');
                return const Text('Something went wrong');
              } else if (snapshots.connectionState == ConnectionState.waiting) {
                return const Text('');
              }
              return CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: IconButton(
                  onPressed: () {
                    snapshots.data!.docs.isEmpty
                        ? addFavouriteItem()
                        : deleteFavouriteItem(id: snapshots.data!.docs[0].id);
                  },
                  icon: snapshots.data!.docs.isEmpty
                      ? const Icon(
                          Icons.favorite_outline,
                          color: kTextLightColor,
                        )
                      : const Icon(
                          Icons.favorite_rounded,
                          color: kTextLightColor,
                        ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
        title: const Text('Details Screen'),
      ),
      body: Body(snapShot: snapShot, index: index),
    );
  }
}
