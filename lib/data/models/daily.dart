import 'package:weathery/data/models/temp_model.dart';
import 'package:weathery/data/models/weather.dart';

class Daily {
  int? dt;
  Temp? temp;
  num? pressure;
  num? humidity;
  num? windSpeed;
  List<Weather>? weather;
  Daily({
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.pressure,
    required this.weather,
    required this.windSpeed,
  });
  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
        dt: json['dt'] ?? 0,
        temp: Temp.fromJson(json['temp']),
        humidity: json['humidity']?? 0,
        pressure: json['pressure'] ?? 0,
         weather: (json['weather'] as List)
            .map((weather) => Weather.fromJson(weather))
            .toList(),
        windSpeed: json['wind_speed']?? 0);
  }
}
