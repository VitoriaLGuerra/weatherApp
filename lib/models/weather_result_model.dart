import 'dart:convert';

import 'package:untitled/constants/enum.dart';

class WeatherResultModel {
  final int id;
  final TempEnum main;
  final String icon;

  WeatherResultModel({
    required this.id,
    required this.main,
    required this.icon,
  });

  factory WeatherResultModel.fromRawJson(String str) => WeatherResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherResultModel.fromJson(Map<String, dynamic> json) => WeatherResultModel(
    id: json["id"],
    main: tempEnumValues.map[json["main"]]!,
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": tempEnumValues.reverse[main],
    "icon": icon,
  };
}