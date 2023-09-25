import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/models/city_response_model.dart';

//textConstants

const appName = 'ClimaClock';
const wellCome = 'Bem Vindo, ';

//list
List<CityResponseModel> cities = [
  CityResponseModel(name: 'Lisboa', id: 2267056),
  CityResponseModel(name: 'Faro', id: 2268337),
  CityResponseModel(name: 'Leiria', id: 2267094),
  CityResponseModel(name: 'Porto', id: 2735941),
  CityResponseModel(name: 'Coimbra', id: 2740636),
];

//styles

const kTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 24,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kTextStyleHome = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 26,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);
const kTextStyleHomeBig = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 35,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);
const kTextStyleHomeExtra= TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

//paddingSizes
const kPaddingSmall = 10.0;
const kPaddingMedium = 20.0;
const kPaddingLarge = 40.0;

//sizes
const kSizeXSmall = 4.0;
const kSizeSmall = 15.0;
const kSizeMedium = 30.0;
const kSizeLarge = 50.0;
const kSizeExtra = 70.0;

//appId
const appId = "ae23e768aac7de22351dfc068d162c3e";

//API_URL
const baseURI = 'api.openweathermap.org';
const pathURl = '/data/2.5/forecast';

//dateformat
final dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');