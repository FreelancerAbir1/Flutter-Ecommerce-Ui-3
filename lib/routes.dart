import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommecre_ui3/Auth%20Screen/Complete%20Form/complete_form.dart';
 
import 'Auth Screen/Create User/create_user.dart';
import 'Auth Screen/Login Screen/login_screen.dart';
import 'Screen/Home Screen/home_screen.dart';
import 'Screen/Splash Screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreenCustom.route:(context) => const SplashScreenCustom(),
  CompleteForm.route:(context) => const CompleteForm(),
  CreateUser.route:(context) => const CreateUser(),
  HomeScreen.route :(context) =>   const HomeScreen(),
  LoginScreen.route:(context) => const LoginScreen(),
};
