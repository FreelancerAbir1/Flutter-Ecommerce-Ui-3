
import 'package:flutter/material.dart';

import '../../../constant.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      child: MaterialButton(
        color: kPrimaryColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: kTextLightColor,
          ),
        ),
      ),
    );
  }
}
