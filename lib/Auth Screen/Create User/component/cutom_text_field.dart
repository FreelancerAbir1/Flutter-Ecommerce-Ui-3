import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validate;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final FocusNode focusNode;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmitted;
  final TextInputAction textInputAction;
 
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.validate,
    required this.controller,
    required this.keyboardType,
    required this.onChange,
    required this.suffixIcon,
    required this.obscureText,
    required this.focusNode,
    this.onFieldSubmitted, required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(kDefaultPadding - 15),
          ),
          child: Icon(
            icon,
            color: kTextLightColor,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: TextFormField(
            autofocus: true,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted, 
            focusNode: focusNode,
            obscureText: obscureText,
            onChanged: onChange,
            keyboardType: keyboardType,
            controller: controller,
            validator: validate,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }
}
