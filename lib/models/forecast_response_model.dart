import 'dart:convert';

import 'city_response_model.dart';
import 'forecast_element_response_model.dart';

class ForecastResponseModel {
  final String cod;
  final int message;
  final int cnt;
  final List<ForecastElementResponseModel> list;
  final CityResponseModel city;

  ForecastResponseModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory ForecastResponseModel.fromRawJson(String str) => ForecastResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForecastResponseModel.fromJson(Map<String, dynamic> json) => ForecastResponseModel(
    cod: json["cod"],
    message: json["message"],
    cnt: json["cnt"],
    list: List<ForecastElementResponseModel>.from(json["list"].map((x) => ForecastElementResponseModel.fromJson(x))),
    city: CityResponseModel.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "message": message,
    "cnt": cnt,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "city": city.toJson(),
  };
}