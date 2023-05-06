import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/utils/colors.dart';
import 'package:weathery/views/widgets/global_appbar.dart';
import 'package:weathery/views/widgets/search_delegate.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GlobalAppbar(
        title: "Forecast Report",
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: AppColors.c_060D26,
        child: Column(
          children: [
            Text(
              "Type the area or city you want to know the \ndetailed weather information at \nthis time.",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12.h,
            ),
            IconButton(
                onPressed: () async {
                  var searchText = await showSearch(
                      context: context, delegate: SearchDelegateView());
                },
                icon: Icon(Icons.search),)
          ],
        ),
      ),
    );
  }
}
