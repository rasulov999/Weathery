import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weathery/utils/colors.dart';

class DailyWeatherItems extends StatelessWidget {
  DailyWeatherItems(
      {super.key,
      required this.dt,
      required this.temp,
      required this.dt2,
      required this.iconName});
  dynamic dt;
  num temp;
  dynamic dt2;
  String? iconName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, right: 20.w).r,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27.w).r,
        width: 352.w,
        height: 84.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.c_272F3A,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  dt,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                  dt2,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Text(
              '$temp°C',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 36.sp,
              ),
            ),
            CachedNetworkImage(
              imageUrl: 'http://openweathermap.org/img/w/$iconName.png',
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 70,
                        height: 70,
                        color: Colors.white,
                      ),
                    ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
