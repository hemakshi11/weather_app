import 'package:geolocator/geolocator.dart';

class GetLocation {
  double latitude;
  double longitude;

  Future getCurrrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
