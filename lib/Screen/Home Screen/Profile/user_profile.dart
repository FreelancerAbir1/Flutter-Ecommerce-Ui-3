import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    setState(() {
      user!.displayName;
      user!.email;
      user!.photoURL;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: userProfileCollection.get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {}
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    currentAccountPicture: ClipOval(
                      child: user!.photoURL == null
                          ? Center(
                              child: Text(
                              '${data['name']}'.characters.first,
                              style: TextStyle(
                                  fontSize: 50.h,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                          : Image.network(
                              'https://png.pngtree.com/element_our/20190604/ourmid/pngtree-user-avatar-boy-image_1482937.jpg',
                              fit: BoxFit.fill,
                            ),
                    ),
                    accountEmail: Text(
                      data['email'].toString(),
                    ),
                    accountName: Text(
                      data['name'].toString(),
                    ),
                    onDetailsPressed: () {},
                  ),
                  DrawerHeader(
                    child: Text(
                      data['email'].toString(),
                    ),
                  ),
                ],
              );
            }
            return const Text("loading");
          }),
    );
  }
}
