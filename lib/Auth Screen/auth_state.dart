import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';

import '../Screen/Home Screen/home_screen.dart';
import 'Login Screen/login_screen.dart';

class AuthState extends StatefulWidget {
  static const route = '/authstate';

  const AuthState({super.key});

  @override
  State<AuthState> createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  Future authStateChange() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      }
    });
  }

  @override
  void initState() {
    authStateChange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Checking Internet....'),
          SizedBox(height: kDefaultPadding,),
          CircularProgressIndicator(),
        ],
          ),
        ),
      ),
    );
  }
}
