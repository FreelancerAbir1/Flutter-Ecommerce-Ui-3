import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_ecommecre_ui3/constant.dart';

import '../Cart Screen/cart_screen.dart';
import '../Favourite Screen/favourite_screen.dart';
import 'component/body.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home,
    Icons.heart_broken,
    Icons.add_shopping_cart_rounded,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(),
      body:   const Body(),
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
          setState(() {
            _bottomNavIndex = index;
          });
        });
  }
}
