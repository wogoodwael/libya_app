import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/data/datasource/remote/complains_data.dart';
import 'package:libya_bakery/models/complains_model.dart';
import 'package:libya_bakery/presentation/screens/admin/control.dart';
import '../../core/functions/handling_data.dart';
import '../../handling_data/statusrequest.dart';

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