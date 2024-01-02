import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../admin/handling_data/statusrequest.dart';
import '../../../admin/models/orders_model.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/orders/order_details.dart';
import '../../models/cart_model.dart';

class OrderDetailsController extends GetxController{
  late OrdersModel ordersModel;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  double? lat;
  double? long;
  late String totalPrice;
  Completer<GoogleMapController>? completercontroller;
  OrderDetailsData orderDetails = OrderDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;

  initialData(){
    kGooglePlex = CameraPosition(
      target: LatLng(ordersModel.addressLat ?? 0.0, ordersModel.addressLong ?? 0.0),
      zoom: 12.4746,
    );
    markers.add(Marker(markerId: const MarkerId("1"),position:LatLng(ordersModel.addressLat ?? 0.0, ordersModel.addressLong ?? 0.0), ));
  }

  getData() async{
    statusRequest = StatusRequest.loading;
    var response = await orderDetails.getData(ordersModel.orderId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List dataResponse = response['data'];
      data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['orderModel'] ?? OrdersModel();
    totalPrice = ordersModel.orderPrice.toString();
    initialData();
    getData();
    super.onInit();
  }
}