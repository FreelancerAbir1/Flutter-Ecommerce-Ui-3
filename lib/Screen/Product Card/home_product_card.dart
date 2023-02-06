import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant.dart';

class HomeProductCard extends StatelessWidget {
  const HomeProductCard({
    Key? key,
    required this.snapshot,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final List snapshot;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 130.h,
          width: 130.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.sp),
                  child: AspectRatio(
                    aspectRatio: 1.1,
                    child: Image.network(
                      snapshot[index]['img'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '${snapshot[index]['name']} \n  ${snapshot[index]['price']}৳',
                  style: const TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
