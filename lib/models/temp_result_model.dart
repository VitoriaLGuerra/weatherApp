import 'dart:convert';

class TempResultModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  TempResultModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
  });

  factory TempResultModel.fromRawJson(String str) =>
      TempResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TempResultModel.fromJson(Map<String, dynamic> json) => TempResultModel(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
      };
}
