import 'dart:convert';
import 'package:weathery/core/models/hourly_and_daily_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:weathery/data/models/weather_model.dart';

class Service {
  static Future<WeatherModel?> getWeatherData({
    required num? lat,
    required num? lon
  }
 
  ) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=b2148478d8a7133eb6669063773d772c&units=metric';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;
      return WeatherModel.fromJson(json);
    }
    return null;
  }


static Future<HourlyAndDaily?> getWeatherHourlyAndDailyData({
  required num? lat,
    required num? lon
}) async {
    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&units=metric&exclude=minutely,current&appid=649ff9f2558d2c45135158b30bc262d8';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;
      return HourlyAndDaily.fromJson(json);
    }
    return null;
  }
  
}
