import 'dart:convert';

import 'coordinate_response_model.dart';

class CityResponseModel {
  final int id;
  final String name;
  //final CoordinateResponseModel coord;

  CityResponseModel({
    required this.id,
    required this.name,
    //required this.coord,
  });

  factory CityResponseModel.fromRawJson(String str) => CityResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityResponseModel.fromJson(Map<String, dynamic> json) => CityResponseModel(
    id: json["id"],
    name: json["name"],
    //coord: CoordinateResponseModel.fromJson(json["coord"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    //"coord": coord.toJson(),

  };
}
