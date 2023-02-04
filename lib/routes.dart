import 'package:flutter/cupertino.dart';
 import 'Auth Screen/Create User/create_user.dart';
import 'Auth Screen/Login Screen/login_screen.dart';
import 'Auth Screen/auth_state.dart';
import 'Screen/Accessories Product/accessories_product.dart';
import 'Screen/Favourite Screen/favourite_screen.dart';
import 'Screen/Home Screen/home_screen.dart';
import 'Screen/Splash Screen/splash_screen.dart';
import 'Screen/Top Products/top_products.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreenCustom.route: (context) => const SplashScreenCustom(),
  CreateUser.route: (context) => const CreateUser(),
  HomeScreen.route: (context) => const HomeScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  AuthState.route: (context) => const AuthState(),
  TopProducts.route: (context) => const TopProducts(),
  AccessoriesProduct.route: (context) => const AccessoriesProduct(),
  FavouriteScreen.route: (context) => const FavouriteScreen(),
};
