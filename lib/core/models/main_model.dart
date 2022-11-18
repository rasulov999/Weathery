class Main {
  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
  });
  double? temp;
  num? feels_like;
  num? temp_max;
  num? pressure;
  num? humidity;

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json['temp'] ?? 0,
        feels_like: json['feels_like'] ?? 0,
        temp_max: json['temp_max'] ?? 0,
        pressure: json['pressure'] ?? 0,
        humidity: json['humiditiy'] ?? 0);
  }


}
