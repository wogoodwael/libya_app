import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/orders/orders_accepted_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/orders_model.dart';

class OrdersAcceptedController extends GetxController{
  OrdersAcceptedData ordersAcceptedData = OrdersAcceptedData(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;

  getOrders() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersAcceptedData.getData();
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  donePrepare(int orderId, int userId, int orderType) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersAcceptedData.donePrepare(
        orderId,
        userId,
        orderType
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  archiveOrders2(int userId, int orderId) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersAcceptedData.archiveOrder2(
        userId,
        orderId
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }
}