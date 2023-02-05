import 'package:flutter/material.dart';

import '../../../constant.dart';

class SignInText extends StatelessWidget {
  final String text;
  const SignInText({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Text(
       text,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kTextLightColor.withAlpha(150),
            ),
      ),
    );
  }
}
