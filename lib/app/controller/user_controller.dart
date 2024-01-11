import 'package:get/get.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/orders/fund_data.dart';
import '../models/user_model.dart';
import '../services/MyServices.dart';

class UserController extends GetxController{
  UserData userData = UserData(Get.find());

  List<User> data = [];
  late StatusRequest statusRequest;

  getData() async{
    statusRequest = StatusRequest.loading;
    var response = await userData.getData(MyServicesApp.sharedPreferences.getString("email").toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      MyServicesApp.sharedPreferences.setString('user_fund', response['userFund'].toString());
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}