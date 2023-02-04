import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant.dart';

class TopProductCard extends StatelessWidget {
  const TopProductCard({
    Key? key,
    required this.topProductSnapshot,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final List topProductSnapshot;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding.sp - 15.sp),
        child: Container(
          height: 180.h,
          width: 140.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Column(
            children: [
              SizedBox(
                width: 140.h,
                height: 140.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.sp),
                  child: AspectRatio(
                    aspectRatio: 1.1,
                    child: Image.network(
                      topProductSnapshot[index]['img'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '${topProductSnapshot[index]['name']} \n  ${topProductSnapshot[index]['price']}৳',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
