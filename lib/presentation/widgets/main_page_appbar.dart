import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/presentation/utils/colors.dart';




class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.only(top: 40.h, bottom: 22.h).r,
      child: Container(
        width: double.infinity,
        height: 89.h,
        color: AppColors.c_2C303F,
        child: Row(
          children: [
          ],
        ),
      ),
    );
  }
}