import 'package:flutter/material.dart';
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
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                   
                    WeatherModel? model = snapshot.data;
                     DateTime dateTime =
                        DateTime.fromMillisecondsSinceEpoch((model?.dt ?? 0)*1000);
                    return Container(
                      child: Column(
                        children: [
                          Text(
                            model!.name ?? "",
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "$dateTime",
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          Image.network(
                            'http://openweathermap.org/img/w/04d.png',
                            width: 155,
                            height: 15,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${model.main?.temp ?? 0}°C",
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          weatherItems(
                              "${model.main?.temp ?? 0}°C",
                              "${model.main?.humidity ?? 0}%",
                              "${model.wind?.speed ?? 0}km/h")
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      "You Are Loser! XA-XA-XA",
                      style: TextStyle(
                          fontSize: 20,
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
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: SizedBox(
        height: 46,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "Temp",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                Text(
                  temp,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Humidy",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                Text(
                  humidity,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Wind",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                Text(
                  wind,
                  style: const TextStyle(
                      fontSize: 20,
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
