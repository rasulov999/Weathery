import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weathery/presentation/utils/colors.dart';
import 'package:weathery/presentation/utils/images.dart';
import 'package:weathery/presentation/views/navbar/forcast/forcast_page.dart';
import 'package:weathery/presentation/views/navbar/location/location_page.dart';
import 'package:weathery/presentation/views/navbar/search/search_page.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const LocationPage(),
    const SearchPage(),
    const ForcastPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: pages[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius:   BorderRadius.only(topRight: Radius.circular(20.r), 
        topLeft: Radius.circular(20.r),),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.c_101A39,
           onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.location), label: "My location"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.search), label: "Search"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.folder), label: "Forcast"),
          ],
        ),
      ),
  );
  }
}
