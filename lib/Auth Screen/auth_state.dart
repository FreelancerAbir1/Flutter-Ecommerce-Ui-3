import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screen/Home Screen/home_screen.dart';
import 'Login Screen/login_screen.dart'; 

class AuthState extends StatefulWidget {
  const AuthState({Key? key}) : super(key: key);

  @override
  State<AuthState> createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  User? user;
  @override
  void initState() { 
    super.initState();
    FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return   const HomeScreen();
    }
    return const LoginScreen();
  }
}
