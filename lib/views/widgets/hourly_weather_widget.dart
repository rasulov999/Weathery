import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weathery/views/utils/colors.dart';

class HourlyWeaatherContainer extends StatelessWidget {
  HourlyWeaatherContainer(
      {super.key, required this.dt, required this.temp, required this.icon});
  dynamic dt;
  num temp;
  String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w).r,
      child: Container(
        width: 166.w,
        height: 85.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: AppColors.c_272F3A,
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: 'http://openweathermap.org/img/w/$icon.png',
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$dt',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  ('$temp°C'),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
