class Coord {
  num? lon;
  num? lat;
  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(lon: json['lon'] ?? 0, lat: json['lat'] ?? 0);
  }
}
