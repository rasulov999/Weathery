class Wind {
  num? speed;
  num? deg;
  Wind({required this.speed, required this.deg});
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed'] ?? 0, deg: json['deg'] ?? 0);
  }
}
