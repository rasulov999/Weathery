import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/views/utils/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 22.h).r,
      child: Container(
        width: double.infinity,
        height: 89.h,
        color: AppColors.c_2C303F,
        child: FittedBox(
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                " Welcome to Weathery! ",
                speed: const Duration(milliseconds: 100),
                textStyle: const TextStyle(
                  color: AppColors.c_A7B4E0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
