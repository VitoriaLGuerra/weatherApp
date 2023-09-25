import 'package:get/get.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/constants/enum.dart';
import 'package:untitled/domain/repository/forecast_repository.dart';
import 'package:untitled/models/forecast_response_model.dart';
import 'package:untitled/platform/geolocation_method_channel.dart';
import 'package:weather_animation/weather_animation.dart';

class HomeController extends GetxController{
  final RxBool _isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final Rx<ForecastResponseModel?> _weatherData = Rx<ForecastResponseModel?>(null);
  final RxInt _temp = 0.obs;
  final RxInt _maxTemp = 0.obs;
  final RxInt _minTemp = 0.obs;
  bool celcius = true;

  RxBool checkLoading() => _isLoading;
  Rx<ForecastResponseModel?> getModel() => _weatherData;
  RxInt temp() => _temp;
  RxInt maxTemp() => _maxTemp;
  RxInt minTemp() => _minTemp;

  @override
  void onInit() {
    super.onInit();
    if (_isLoading.isTrue) {
      getLocationAndWeather();
    }
  }

  Future<void> getLocationAndWeather() async {
    try {
      _isLoading.value = true;
      await getLocation();
      await getWeather();
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> getLocation() async {
    try {
      var geolocator = MethodChannelGeolocation();

      var permission = await geolocator.haveLocationPermission();

      if (!permission) {
        permission = await geolocator.requestLocationPermission();
        if (!permission) {
          Get.snackbar(
            'GPS',
            'Permissão de localização negada',
            snackPosition: SnackPosition.BOTTOM,
          );
          return Future.error('Permissão de localização negada');
        }
      }

      final coordinates = await geolocator.getCoordinates();
      latitude.value = coordinates.latitude;
      longitude.value = coordinates.longitude;
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _parseTemp(){
    if(celcius){
      _temp.value = parseCelcius(getModel().value!.list[0].main.temp);
      _minTemp.value = parseCelcius(getModel().value!.list[0].main.tempMin);
      _maxTemp.value = parseCelcius(getModel().value!.list[0].main.tempMax);
    } else{
      _temp.value = parseFH(getModel().value!.list[0].main.temp);
      _minTemp.value = parseFH(getModel().value!.list[0].main.tempMin);
      _maxTemp.value = parseFH(getModel().value!.list[0].main.tempMax);

    }
  }

  int parseCelcius(double temp){
    return (temp -272.15).toInt();
  }

  int parseFH(double temp){
    return ((( temp - 273.15) * 9/5) + 32).toInt();
  }

  WeatherScene background(){
    switch (_weatherData.value!.list[0].weather[0].main){
      case TempEnum.CLEAR:
        return WeatherScene.scorchingSun;
        break;
      case TempEnum.CLOUDS:
        return WeatherScene.sunset;
        break;
      case TempEnum.RAIN:
        return WeatherScene.rainyOvercast;
        break;
      default:
        return WeatherScene.weatherEvery;
        break;
    }
  }

  void changeUnity(){
    celcius = !celcius;
    _parseTemp();
  }

  Future<void> getWeather({int? cityId}) async {
    try {
      if(cityId!=null){
        _isLoading.value = true;
      }
      final repo = WeatherRepository();
      ForecastResponseModel weatherData;
      if((latitude.value == 0 && longitude.value == 0) || cityId != null){
        weatherData = await repo.fetchWeather(cityId??cities[0].id);
      } else {
        weatherData = await repo.fetchWeatherByLocation(latitude.value, longitude.value);
      }
      _weatherData.value = weatherData;
      _parseTemp();
      if(cityId!=null){
        _isLoading.value = false;
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }
}