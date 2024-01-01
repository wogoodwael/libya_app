import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/orders/orders_archive_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/orders_model.dart';

class OrdersArchiveController extends GetxController{
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;

  getOrders() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.getData();
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

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }
}