import 'package:flutter/material.dart';

import '../../../constant.dart';

class WelcomeSubtitle extends StatelessWidget {
  final String text;
  const WelcomeSubtitle({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: kTextColor,
          ),
    );
  }
}
