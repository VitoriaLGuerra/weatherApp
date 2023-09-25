import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:untitled/models/auxiliar/coordinates.dart';

import 'geolocation_method_channel.dart';

abstract class GeolocationPlatform extends PlatformInterface {
  GeolocationPlatform() : super(token: _token);

  static final Object _token = Object();

  static GeolocationPlatform _instance = MethodChannelGeolocation();

  static GeolocationPlatform get instance => _instance;

  static set instance(GeolocationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Coordinates> getCoordinates() {
    throw UnimplementedError('showAlert() has not been implemented.');
  }

  Future<bool> haveLocationPermission() {
    throw UnimplementedError('showAlert() has not been implemented.');
  }

  Future<bool> requestLocationPermission() {
    throw UnimplementedError('showAlert() has not been implemented.');
  }
}
