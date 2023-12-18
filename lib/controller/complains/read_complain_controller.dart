import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/data/datasource/remote/complains_data.dart';
import 'package:libya_bakery/models/complains_model.dart';
import 'package:libya_bakery/presentation/screens/admin/control.dart';
import '../../core/functions/handling_data.dart';
import '../../data/services/api.dart';
import '../../handling_data/statusrequest.dart';

class ReadComplainController extends GetxController{
  ComplainsData complainsData = ComplainsData(Get.find());

  late TextEditingController branchNumber;
  late TextEditingController branchBody;
  List<ComplainsModel> data = [];
  ComplainsModel? complainsModel;

  StatusRequest? statusRequest = StatusRequest.none;

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
        Get.off(ControlScreen());
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    complainsModel = Get.arguments['complainsModel'];
    branchNumber = TextEditingController();
    branchBody = TextEditingController();

    branchNumber.text = complainsModel!.complainBranch!.toString();
    branchBody.text = complainsModel!.complainBody!;
  }
}