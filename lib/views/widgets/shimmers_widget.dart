import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weathery/views/utils/colors.dart';

class MyShimmerLoader extends StatelessWidget {
  const MyShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1500),
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 85.w,
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 20.w).r,
                        child: Container(
                          width: 166.w,
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.w,
          ),
          Padding(
            padding: EdgeInsets.only(right: 25.w).r,
            child: Container(
              width: double.infinity,
              height: 22.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 530.h,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(top: 20.h).w,
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      8,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 20.w, bottom: 20.h).r,
                        child: Container(
                          width: 352.w,
                          height: 84.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
