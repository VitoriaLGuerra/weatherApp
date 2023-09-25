import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/constants/constants.dart';

class NetworkClient {

  static Future<Map<String,dynamic>> getForecast(int cidadeId) async {
    final Map<String, String> queryParameters = <String, String>{
      'id': '$cidadeId',
      'APPID': appId
    };

    return await sendRequest(queryParameters);
  }

  static Future<Map<String,dynamic>> getForecastByLocation(double latitude, double longitude) async {
    final Map<String, String> queryParameters = <String, String>{
      'lat': '$latitude',
      'lon': '$longitude',
      'APPID': appId
    };

    return await sendRequest(queryParameters);
  }

  static Future<Map<String,dynamic>> sendRequest(Map<String, String> queryParameters) async {
    var url = Uri.https(baseURI, pathURl, queryParameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw Exception(response);
    }
  }

}
