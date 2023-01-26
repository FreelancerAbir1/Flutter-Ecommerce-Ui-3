


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const SearchBox({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: kTextColor),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(kDefaultPadding.sp - 15.sp)),
              ),
            ),
          ),
          Container(
            height: 50.h,
            width: 50.w,
            color: kPrimaryColor,
            child: const Center(
                child: Icon(
              Icons.search,
              color: kTextLightColor,
            )),
          ),
        ],
      ),
    );
  }
}
