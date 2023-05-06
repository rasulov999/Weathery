import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/utils/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:weathery/utils/style.dart';

class LocationPageAppbar extends StatelessWidget implements PreferredSize {
  const LocationPageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.c_2C303F,
      centerTitle: true,
      elevation: 0,
      title: FittedBox(
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText(
              " Welcome to Weathery! ",
              speed: const Duration(milliseconds: 100),
              textStyle: MyTextStyle.robotoSlabMedium.copyWith(
                fontSize: 30.sp,
                color: AppColors.c_A7B4E0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
