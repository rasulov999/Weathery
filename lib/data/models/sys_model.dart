class Sys {
  int? type;
  int? id;
  String? country;
  num? sunrise;
  num? sunset;
  Sys(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});
  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'] ?? 0,
      country: json['country'] ?? 0,
      id: json['id'] ?? "",
      sunrise: json['sunrise'] ?? 0,
      sunset: json['sunset'] ?? 0,
    );
  }
}
