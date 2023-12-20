import 'package:get/get.dart';
import 'package:libya_bakery/core/functions/handling_data.dart';
import 'package:libya_bakery/data/datasource/remote/orders/orders_pending_data.dart';
import 'package:libya_bakery/handling_data/statusrequest.dart';
import 'package:libya_bakery/models/orders_model.dart';

class OrdersPendingController extends GetxController{
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;

  getOrders() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.getData();
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

  approveOrders(int userId, int orderId) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.approveOrder(
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

  archiveOrders(int userId, int orderId) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.archiveOrder(
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