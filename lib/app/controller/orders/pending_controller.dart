import 'package:get/get.dart';
import '../../../admin/handling_data/statusrequest.dart';
import '../../../admin/models/orders_model.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/orders/pending_data.dart';
import '../../services/MyServices.dart';

class PendingOrdersController extends GetxController{
  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.find());
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;


  String printOrderType(String val){
    if(val == "0"){
      return "Delivery";
    } else {
      return "Receive";
    }
  }

  String printPaymentMethod(String val){
    if(val == "0"){
      return "Cash on Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val){
    if(val == "0"){
      return "في انتظار الموافقة";
    } else if(val == "1") {
      return "جارٍ إعداد الطلب";
    } else if (val == "2"){
      return "الطلب في الطريق";
    } else{
      return "Archive";
    }
  }

  getOrders() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData.getData(int.parse(MyServicesApp.sharedPreferences.getString('id').toString()));
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