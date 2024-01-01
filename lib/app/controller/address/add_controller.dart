import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../admin/handling_data/statusrequest.dart';

class AddressController extends GetxController{
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  Completer<GoogleMapController>? completercontroller;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  double? lat;
  double? long;

  addMarker(LatLng latLng){
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'),position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  getCurrentPostion() async{
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.476,
    );
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    completercontroller = Completer<GoogleMapController>();
    getCurrentPostion();
  }
}