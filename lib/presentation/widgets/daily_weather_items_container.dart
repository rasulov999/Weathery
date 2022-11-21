import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/presentation/utils/colors.dart';

class DailyWeatherItems extends StatelessWidget {
  DailyWeatherItems({super.key, required this.dt, required this.temp,});
   dynamic dt;
  num temp;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 20.h,right: 28.w).r,
      child: Container(padding: EdgeInsets.symmetric(horizontal: 27.w,).r,
        width: 352.w,
        height: 84.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: AppColors.c_272F3A,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dt,style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,),
          ),
            Text('$temp°C',style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 36.sp,), 
            ),
          ],
        ),
      ),
    );
  }
}
