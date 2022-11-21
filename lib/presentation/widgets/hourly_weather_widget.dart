import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/presentation/utils/colors.dart';


class HourlyWeaatherContainer extends StatelessWidget {
  HourlyWeaatherContainer({super.key, required this.dt, required this.temp,});
  dynamic dt;
  num temp;
  //String icon;
  @override
  Widget build(BuildContext context) {
  
    return Padding(padding: EdgeInsets.only(right: 20.w).r,
      child: Container(
        width: 166.w,
        height: 85.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color:AppColors.c_272F3A,
        ),
        child: Column( crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$dt',
              style:  TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.white),
            ),
             SizedBox(height:5.h,),
            Text(
              ('$temp°C'),
              style:  TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
