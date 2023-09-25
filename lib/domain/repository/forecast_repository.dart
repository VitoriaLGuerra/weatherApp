import 'package:untitled/infra/network_client.dart';
import 'package:untitled/models/forecast_response_model.dart';

class WeatherRepository {
  Future<ForecastResponseModel> fetchWeather(int cidadeId) async {
    final response = await NetworkClient.getForecast(cidadeId);
    return ForecastResponseModel.fromJson(response);
  }

  Future<ForecastResponseModel> fetchWeatherByLocation(double latitude, double longitude) async {
    final response = await NetworkClient.getForecastByLocation(latitude, longitude);
    return ForecastResponseModel.fromJson(response);
  }

}
