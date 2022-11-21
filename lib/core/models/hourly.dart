import 'package:weathery/core/models/weather.dart';

class Hourly {
  int? dt;
  num? temp;
  num? humidity;
  num? wind_speed;
  List<Weather>? weather;
  Hourly({
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.wind_speed,
    required this.weather,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['dt'] ?? 0,
      temp: json['temp'] ?? 0,
      humidity: json['humidity'] ?? 0,
      wind_speed: json['wind_speed'] ?? 0,
       weather: (json['weather'] as List)
            .map((weather) => Weather.fromJson(weather))
            .toList(),
    );
  }
}
