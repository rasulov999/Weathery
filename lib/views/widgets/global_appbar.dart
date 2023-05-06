import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/utils/colors.dart';
import 'package:weathery/utils/style.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSize {
  const GlobalAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.c_060D26,
      centerTitle: true,
      elevation: 0,
      title: Text(
        title,
        style: MyTextStyle.robotoSlabMedium
            .copyWith(fontSize: 30.sp, color: AppColors.white),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
