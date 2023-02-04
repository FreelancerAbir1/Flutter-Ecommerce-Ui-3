
import 'package:flutter/material.dart';

import '../../../constant.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.text,
    this.onPress,
  }) : super(key: key);
  final String text;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      child: MaterialButton(
        color: kPrimaryColor,
        onPressed: onPress,
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