import 'package:weathery/models/daily.dart';
import 'package:weathery/models/hourly.dart';

class HourlyAndDaily {
  num? lat;
  num? lon;
  String? timezone;
  List<Hourly>? hourly;
  List<Daily>? daily;
  HourlyAndDaily({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.hourly,
    required this.daily
  });

  factory HourlyAndDaily.fromJson(Map<String, dynamic> json) {
    return HourlyAndDaily(
      lat: json['lat'] ?? 0,
      lon: json['lon'] ?? 0,
      timezone: json['timezone'] ?? "",
      hourly: (json['hourly'] as List)
          .map((json) => Hourly.fromJson(json))
          .toList(),
      daily:  (json['daily']as List).map((json) => Daily.fromJson(json)).toList()
    );
  }
}
