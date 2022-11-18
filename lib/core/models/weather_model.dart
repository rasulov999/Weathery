import 'package:weathery/core/models/clouds_model.dart';
import 'package:weathery/core/models/coord_model.dart';
import 'package:weathery/core/models/main_model.dart';
import 'package:weathery/core/models/sys_model.dart';
import 'package:weathery/core/models/weather.dart';
import 'package:weathery/core/models/wind_model.dart';

class WeatherModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;
  WeatherModel(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        coord: Coord.fromJson(json['coord']),
        weather: (json['weather'] as List)
            .map((weather) => Weather.fromJson(weather))
            .toList(),
        base: json['base'] ?? "",
        main: Main.fromJson(json['main']),
        visibility: json['visibility'] ?? 0,
        wind: Wind.fromJson(json['wind']),
        clouds: Clouds.fromjson(json['clouds']),
        dt: json['dt'] ?? 0,
        sys: Sys.fromJson(json['sys']),
        timezone: json['timezone'] ?? 0,
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
        cod: json['cod'] ?? 0);
  }
}
