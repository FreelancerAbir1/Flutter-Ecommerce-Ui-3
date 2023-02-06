import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';

import '../../Auth Screen/Login Screen/login_screen.dart';
import '../Cart Screen/cart_screen.dart';
import '../Favourite Screen/favourite_screen.dart';
import 'Profile/user_profile.dart';
import 'component/body.dart';
import 'component/headline_text.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  var _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home,
    Icons.heart_broken,
    Icons.add_shopping_cart_rounded,
    Icons.person,
  ];
  Future signOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    } on FirebaseAuthException {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadlineEcommerce(text: 'Ecommerce'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  value: '/about',
                  child: GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                        onTap: () {}, child: const Text("About")),
                  ),
                ),
                PopupMenuItem(
                  value: '/setting',
                  child: GestureDetector(child: const Text("Setting")),
                ),
                PopupMenuItem(
                  value: '/logout',
                  child: GestureDetector(
                      onTap: () {
                        signOut(context);
                      },
                      child: const Text("Log Out")),
                ),
              ];
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(),
      body: const Body(),
    );
  }

  AnimatedBottomNavigationBar buildBottomNavBar() {
    return AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: kTextLightColor,
        splashColor: kTextColor,
        elevation: 20,
        backgroundColor: kPrimaryColor,
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FavouriteScreen(),
            ));
          }
          if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ));
          }
          if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const UserProfile(),
            ));
          }
          setState(() {
            _bottomNavIndex = index;
          });
        });
  }
}
