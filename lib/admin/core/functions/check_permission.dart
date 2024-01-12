import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

requestPerLocation() async{
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // return Get.snackbar('Attention', 'Please allow location');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.snackbar('Attention', 'Please allow location for the application');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Get.snackbar('Attention', 'The Application can\'t be open without allowing the location');
  }
}