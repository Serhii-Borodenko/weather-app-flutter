import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      latitude = 50.4333949331;
      longitude = 30.5199329203;
      throw 'Something goes wrong: $e';
    }
  }
}
