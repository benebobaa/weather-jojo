import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      bool isEnable = await Geolocator.isLocationServiceEnabled();
      print(isEnable);
      if (!isEnable) {
        permission = await Geolocator.checkPermission();
      }
      print(permission);
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }
      print(permission);

      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      Geolocator.requestPermission();
      return Future.error(e);
    }
  }
}
