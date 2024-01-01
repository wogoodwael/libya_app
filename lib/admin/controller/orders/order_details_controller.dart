import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/orders/order_details_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/cart_model.dart';
import '../../models/orders_model.dart';

class OrderDetailsController extends GetxController{
  late OrdersModel ordersModel;
  late String totalPrice;
  OrdersDetailsData orderDetails = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;

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
    getData();
    super.onInit();
  }
}