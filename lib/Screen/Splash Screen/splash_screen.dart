import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/Auth%20Screen/Login%20Screen/login_screen.dart';

import '../../constant.dart';

class SplashScreenCustom extends StatefulWidget {
  static const route = '/';
  const SplashScreenCustom({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreenCustom> createState() => _SplashScreenCustomState();
}

class _SplashScreenCustomState extends State<SplashScreenCustom> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'E-Commerce',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 50,
                  color: kTextLightColor,
                  fontWeight: FontWeight.bold),
            ),
            const CircularProgressIndicator(
              strokeWidth: 8,
              color: kTextLightColor,
            ),
          ],
        ),
      ),
    );
  }
}
