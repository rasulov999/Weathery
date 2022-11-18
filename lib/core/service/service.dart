import 'dart:convert';
import 'package:weathery/core/models/weather_model.dart';
import 'package:http/http.dart' as http;

class Service {
  static Future<WeatherModel?> getWeatherData() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=41.2858420998385&lon=69.20358930577339&appid=b2148478d8a7133eb6669063773d772c&units=metric';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;
      return WeatherModel.fromJson(json);
    }
    return null;
  }
}
