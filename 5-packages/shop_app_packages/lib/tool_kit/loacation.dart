import 'package:geolocator/geolocator.dart';

enum LocationStatus {
  ok,
  disabled,
  denied,
}

abstract class Location {
  //

  static Future<LocationStatus> checkLoacationService() async {
    var permission = await Geolocator.checkPermission();
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationStatus.disabled;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return LocationStatus.denied;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return LocationStatus.denied;
    }
    return LocationStatus.ok;
  }

  static Future<({Position? position, LocationStatus status})>
      getLocation() async {
    LocationStatus status = await checkLoacationService();
    if (status == LocationStatus.ok) {
      final res = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return (position: res, status: status);
    } else {
      return (position: null, status: status);
    }
  }
}
