import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/handling_data.dart';
import '../data/datasource/remote/user_data.dart';
import '../handling_data/statusrequest.dart';
import '../models/user_model.dart';

class UserViewController extends GetxController{
  UserData userData = UserData(Get.find());

  List data = [];
  List<String> userTypes = ["Admin","مستخدم عادي","صاحب محل","صاحب فرن"];
  late StatusRequest statusRequest;
  int? selectedCat;
  int? userType;
  final editUserFundController = TextEditingController();

  changeCat(val, userVal) {
    selectedCat = val;
    userType = userVal;
    getData(userType!);
    update();
  }

  getData(userType) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.changeType(userType);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == 'success'){
        List dataList = response['data'];
        data.addAll(dataList.map((e) => UserModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  getDataIntial() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.viewData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == 'success'){
        List dataList = response['data'];
        data.addAll(dataList.map((e) => UserModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  changeFund(id , fund) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.changeFund(id, fund);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == 'success'){
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    getDataIntial();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDataIntial();
  }
}