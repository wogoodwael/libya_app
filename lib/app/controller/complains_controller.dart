import 'package:get/get.dart';
import 'package:libya_bakery/app/presentation/screens/home/home.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/complains_data.dart';
import '../models/complains_model.dart';
import '../services/MyServices.dart';

class ComplainsController extends GetxController{
  ComplainsData complainsData = ComplainsData(Get.find());
  List<ComplainsModel> data = [];
  late StatusRequest statusRequest;

  sendComplain(String complain, int branchCode) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await complainsData.sendComplain(
        int.parse(MyServices.sharedPreferences.getString('id').toString()),
        complain,
        branchCode
    );
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        Get.off(const HomeScreen());
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  getComplains() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await complainsData.getComplains(int.parse(MyServices.sharedPreferences.getString('id').toString()));
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        List listData = response['data'];
        data.addAll(listData.map((e) => ComplainsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getComplains();
  }

}