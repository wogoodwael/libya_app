import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/complains_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/complains_model.dart';
import '../../presentation/screens/admin/control.dart';

class ReadComplainController extends GetxController{
  ComplainsData complainsData = ComplainsData(Get.find());

  late TextEditingController branchNumber;
  late TextEditingController branchBody;
  late TextEditingController msgBody;
  List<ComplainsModel> data = [];
  ComplainsModel? complainsModel;
  bool isShown = false;

  changeVisibility(){
    isShown = !isShown;
    update();
  }

  StatusRequest? statusRequest = StatusRequest.none;

  replyToComplain(String email, String replyMsg) async{
    statusRequest = StatusRequest.loading;
    var response = await complainsData.sendReply(
        email,
        replyMsg,
    );
    statusRequest = handlingData(response);
    StatusRequest.success == statusRequest;
    Get.off(ControlScreen());
    update();
  }

  @override
  void onInit() {
    super.onInit();
    complainsModel = Get.arguments['complainsModel'];
    branchNumber = TextEditingController();
    branchBody = TextEditingController();
    msgBody = TextEditingController();

    branchNumber.text = complainsModel!.complainBranch!.toString();
    branchBody.text = complainsModel!.complainBody!;
  }
}