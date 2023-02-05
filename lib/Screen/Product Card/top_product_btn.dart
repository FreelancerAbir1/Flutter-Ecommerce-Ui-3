
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';

class TopProductButton extends StatelessWidget {
  final String topProduct;
  final String viewText;
  final GestureTapCallback onTap;
  const TopProductButton({
    Key? key,
    required this.topProduct,
    required this.viewText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding.sp - 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            topProduct,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: kPrimaryColor,
                ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  viewText,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kPrimaryColor,
                      ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
