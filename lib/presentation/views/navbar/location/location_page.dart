import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathery/core/models/weather_model.dart';
import 'package:weathery/core/service/service.dart';
import 'package:weathery/presentation/utils/colors.dart';
import 'package:weathery/presentation/widgets/main_page_appbar.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: AppColors.c_060D26,
        child: Column(
          children: [
            const MainAppBar(),
            SizedBox(
              child: FutureBuilder(
                future: Service.getWeatherData(),
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
                    WeatherModel? model = snapshot.data;
                    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                        (model?.dt ?? 0) * 1000);
                    return Column(
                      children: [
                        Text(
                          model!.name ?? "",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "$dateTime",
                          style:  TextStyle(
                              color: AppColors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.network(
                          'http://openweathermap.org/img/w/04d.png',
                          width: 155.w,
                          height: 15.h),
                       SizedBox(height: 20.h,),
                        Text(
                          "${model.main?.temp?.round()?? 0}°C",
                          style:  TextStyle(
                              color: AppColors.white,
                              fontSize: 70.sp,
                              fontWeight: FontWeight.w500),
                        ),
                         SizedBox(height: 38.h,),
                        weatherItems(
                            "${model.main?.temp?.round() ?? 0}°C",
                            "${model.main?.humidity ?? 0}%",
                            "${model.wind?.speed ?? 0}km/h"),
                         SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 22.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text(
                                "Today",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                "View report",
                                style: TextStyle(
                                    color: AppColors.c_A7B4E0,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        // ListView.builder(itemBuilder: (context, index) {
                        //   return HourlyWeaatherContainer(dt: dt, temp: temp);
                        // })
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
            )
          ],
        ),
      ),
    );
  }

  Widget weatherItems(String temp, String humidity, String wind) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 36.w),
      child: SizedBox(
        height: 46.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                 Text(
                  "Temp",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                Text(
                  temp,
                  style:  TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
              ],
            ),
            Column(
              children: [
                 Text(
                  "Humidy",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                Text(
                  humidity,
                  style:  TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
              ],
            ),
            Column(
              children: [
                 Text(
                  "Wind",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                Text(
                  wind,
                  style:  TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
