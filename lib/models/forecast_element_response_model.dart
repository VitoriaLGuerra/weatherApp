import 'dart:convert';

import 'package:untitled/models/temp_result_model.dart';
import 'package:untitled/models/weather_result_model.dart';

class ForecastElementResponseModel {
  final int dt;
  final TempResultModel main;
  final List<WeatherResultModel> weather;
  final DateTime dtTxt;

  ForecastElementResponseModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.dtTxt,
  });

  factory ForecastElementResponseModel.fromRawJson(String str) => ForecastElementResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForecastElementResponseModel.fromJson(Map<String, dynamic> json) => ForecastElementResponseModel(
    dt: json["dt"],
    main: TempResultModel.fromJson(json["main"]),
    weather: List<WeatherResultModel>.from(json["weather"].map((x) => WeatherResultModel.fromJson(x))),
    dtTxt: DateTime.parse(json["dt_txt"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": main.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "dt_txt": dtTxt.toIso8601String(),
  };
}