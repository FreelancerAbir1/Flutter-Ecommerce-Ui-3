 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class AccesoriesProductButton extends StatelessWidget {
  final String accesoriesProduct;
  final String viewText;
  final GestureTapCallback onTap;
  const AccesoriesProductButton({
    Key? key,
    required this.accesoriesProduct,
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
            accesoriesProduct,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: kPrimaryColor,
                ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  viewText,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
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
