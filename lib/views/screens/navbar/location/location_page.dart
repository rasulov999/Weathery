import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weathery/data/models/hourly_and_daily_data_model.dart';
import 'package:weathery/data/models/weather_model.dart';
import 'package:weathery/core/service/service.dart';
import 'package:weathery/utils/colors.dart';
import 'package:weathery/views/widgets/hourly_weather_widget.dart';
import 'package:weathery/views/screens/navbar/location/widget/location_page_appbar.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key, required this.lat, required this.lon});
  late num lat;
  late num lon;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LocationPageAppbar(),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: AppColors.c_060D26,
        child: Column(
          children: [
            SizedBox(
              child: FutureBuilder(
                future:
                    Service.getWeatherData(lat: widget.lat, lon: widget.lon),
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
                        style: TextStyle(
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
                          DateFormat.yMMMd().format((dateTime)),
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 155.w,
                          height: 155.h,
                          child: Image.network(
                              'http://openweathermap.org/img/w/04d.png',
                              width: 155.w,
                              height: 15.h),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "${model.main?.temp?.round() ?? 0}°C",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 70.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        weatherItems(
                            "${model.main?.temp?.round() ?? 0}°C",
                            "${model.main?.humidity ?? 0}%",
                            "${model.wind?.speed ?? 0}km/h"),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: Row(
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
                                "View report",
                                style: TextStyle(
                                    color: AppColors.c_A7B4E0,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        SizedBox(
                          child: FutureBuilder(
                            future: Service.getWeatherHourlyAndDailyData(
                                lat: widget.lat, lon: widget.lon),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    snapshot.error.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                );
                              }
                              if (snapshot.hasData) {
                                HourlyAndDaily? model = snapshot.data;
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 85.h,
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: model?.hourly?.length ?? 0,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          DateTime dateTimee = DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  (model?.hourly?[index].dt ??
                                                          0) *
                                                      1000);
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(left: 13.w).r,
                                            child: HourlyWeaatherContainer(
                                              icon: model?.hourly?[index]
                                                      .weather?[0].icon ??
                                                  "",
                                              dt: DateFormat.Hm().format(
                                                (dateTimee),
                                              ),
                                              temp: model?.hourly?[index].temp
                                                      ?.round() ??
                                                  0,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return Center(
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
                    );
                  }
                  return Center(
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
      padding: EdgeInsets.symmetric(horizontal: 36.w),
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
                  style: TextStyle(
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
                  style: TextStyle(
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
                  style: TextStyle(
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
