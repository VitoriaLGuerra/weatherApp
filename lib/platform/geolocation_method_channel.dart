import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:untitled/models/auxiliar/coordinates.dart';

import 'geolocation_platform_interface.dart';

class MethodChannelGeolocation extends GeolocationPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('location');

  @override
  Future<Coordinates> getCoordinates() async {
    try {
      final String location = await methodChannel.invokeMethod('getLocation');
      var latLong = location.split(' ');
      var coord = Coordinates(
          latitude: double.parse(latLong[0]),
          longitude: double.parse(latLong[1]));
      return coord;
    } on PlatformException catch (e) {
      throw Exception(
          "Failed to get location: '${e.message}, ${e.stacktrace}'.");
    }
  }

  @override
  Future<bool> haveLocationPermission() async {
    try {
      final bool havePermission =
          await methodChannel.invokeMethod("haveLocationPermission");
      return havePermission;
    } on PlatformException catch (e) {
      throw Exception(
          "Failed to check location permission: '${e.message}, ${e.stacktrace}'.");
    }
  }

  @override
  Future<bool> requestLocationPermission() async {
    try {
      final bool havePermission =
          await methodChannel.invokeMethod("requestLocationPermission");
      return havePermission;
    } on PlatformException catch (e) {
      throw Exception(
          "Failed to check location permission: '${e.message}, ${e.stacktrace}'.");
    }
  }
}
