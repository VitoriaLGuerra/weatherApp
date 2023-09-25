import 'package:untitled/models/auxiliar/coordinates.dart';

import 'geolocation_platform_interface.dart';

class Geolocation {

  Future<Coordinates> getCoordinates() async {
    return await GeolocationPlatform.instance.getCoordinates();
  }

  Future<bool> haveLocationPermission() async {
    return await GeolocationPlatform.instance.haveLocationPermission();
  }

  Future<bool> requestLocationPermission() async {
    return await GeolocationPlatform.instance.requestLocationPermission();
  }
}
