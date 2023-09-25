import 'dart:convert';

class CoordinateResponseModel {
  final double lat;
  final double lon;

  CoordinateResponseModel({
    required this.lat,
    required this.lon,
  });

  factory CoordinateResponseModel.fromRawJson(String str) =>
      CoordinateResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoordinateResponseModel.fromJson(Map<String, dynamic> json) =>
      CoordinateResponseModel(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
