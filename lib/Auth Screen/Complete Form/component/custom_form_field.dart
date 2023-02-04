import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final Widget suffix;
  final TextEditingController controller;
  final Function(String) onFieldSubmitted;
  final FocusNode focusNode;
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.validator,
    this.onChange,
    required this.suffix,
    required this.controller,
    required this.onFieldSubmitted,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kTextColor),
          suffixIcon: suffix),
      validator: (value) {
        return null;
      },
      onChanged: (value) {},
    );
  }
}
