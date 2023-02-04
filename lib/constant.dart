import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kTextColor = Color(0xFF757575);
const kTextLightColor = Color(0xFFFAFAFA);
const kDefaultFontBold = TextStyle(fontWeight: FontWeight.bold);
const kDefaultFontNormal = TextStyle(fontWeight: FontWeight.normal);
const kDefaultPadding = 21.0;
//! collection stream fetch
final cartItemCollection = FirebaseFirestore.instance
    .collection('cart-items')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection('added-cart-items');
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
