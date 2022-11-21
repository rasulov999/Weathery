import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/core/models/hourly_and_daily_data_model.dart';
import 'package:weathery/core/service/service.dart';
import 'package:weathery/presentation/utils/colors.dart';
import 'package:weathery/presentation/widgets/daily_weather_items_container.dart';
import 'package:weathery/presentation/widgets/hourly_weather_widget.dart';

class ForcastPage extends StatelessWidget {
  const ForcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
     
    return Scaffold(
      body: Container(
        padding:  EdgeInsets.only(left: 28.w).r,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: AppColors.c_060D26,
        child: Column(
          children: [
           SizedBox(height: 45.h,),
             Text(
              "Forecast Report",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500),
            ),
             SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Today",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "$dateTime",
                  style:  TextStyle(
                      color: AppColors.c_A7B4E0,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            SizedBox(
              child: FutureBuilder(
                future: Service.getWeatherHourlyAndDailyData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style:  TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    HourlyAndDaily ? model= snapshot.data;
                 
                  return  Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 85.h,
                        child: ListView.builder(
                          physics: const  BouncingScrollPhysics(),
                            itemCount: model?.hourly?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              DateTime dateTimee = DateTime.fromMillisecondsSinceEpoch(
                            (model?.hourly?[index].dt ?? 0) * 1000);
                            return HourlyWeaatherContainer(
                           //   icon: "${model?.hourly?[index].weather?[index].icon}",
                              dt:dateTimee.toString(),
                              temp: model?.hourly?[index].temp?.round() ?? 0,
                            );
                          },),
                      ),
                      SizedBox(height: 32.h,),
                      Text("Next Forecast",style: TextStyle(
                      color: AppColors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w300),),
                    //  SizedBox(height: 10.h,),
                      SizedBox(
                        height: 550.h,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:  model?.daily?.length ?? 0, 
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index){
                              DateTime dailyTime = DateTime.fromMillisecondsSinceEpoch(
                            (model?.daily?[index].dt ?? 0) * 1000);
                            return DailyWeatherItems(
                              dt: dailyTime.toString(),
                             temp:  model?.daily?[index].temp?.day?.round() ?? 0);
                          },),
                      ),
                    ],
                  );
                  
                  }
                  return  Center(
                    child: Text(
                      "You Are Loser! XA-XA-XA",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
