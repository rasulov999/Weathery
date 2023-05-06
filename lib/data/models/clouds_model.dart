class Clouds {
  int? all;
  Clouds({required this.all});
  factory Clouds.fromjson(Map<String, dynamic> json) {
    return Clouds(all: json['all'] ?? 0);
  }
}
