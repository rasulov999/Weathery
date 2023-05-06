import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weathery/utils/colors.dart';
import 'package:weathery/utils/images.dart';
import 'package:weathery/views/screens/navbar/forcast/forcast_page.dart';
import 'package:weathery/views/screens/navbar/location/location_page.dart';
import 'package:weathery/views/screens/navbar/search/search_page.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key, required this.lat, required this.lon});
  late num? lat;
  late num? lon;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  int selectedIndex = 0;
  int selected = 0;
  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      LocationPage(
        lat: widget.lat!,
        lon: widget.lon!,
      ),
      const SearchPage(),
      ForcastPage(lat: widget.lat!, lon: widget.lon!),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: ClipRRect(
        clipBehavior: Clip.none,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 72.h,
          child: BottomNavigationBar(
            selectedFontSize: 18.sp,
            unselectedFontSize: 18.sp,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.c_557EAE,
            elevation: 0,
            backgroundColor: AppColors.c_101A39,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(AppIcons.location,
                      color: AppColors.white),
                  icon: SvgPicture.asset(AppIcons.location),
                  label: "My location"),
              BottomNavigationBarItem(
                  activeIcon:
                      SvgPicture.asset(AppIcons.search, color: AppColors.white),
                  icon: SvgPicture.asset(AppIcons.search),
                  label: "Search"),
              BottomNavigationBarItem(
                  activeIcon:
                      SvgPicture.asset(AppIcons.folder, color: AppColors.white),
                  icon: SvgPicture.asset(AppIcons.folder),
                  label: "Forcast"),
            ],
          ),
        ),
      ),
    );
  }
}
