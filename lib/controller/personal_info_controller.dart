import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/data/services/api.dart';

import '../core/functions/handling_data.dart';
import '../data/datasource/remote/update_info_data.dart';
import '../handling_data/statusrequest.dart';

class PersonalInfoController extends GetxController{
  UpdateInfoData updateInfoData = UpdateInfoData(Get.find());
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController mobile;

  StatusRequest statusRequest = StatusRequest.none;

  updateUserInfo(String firstName, String lastName, String email, String mobile) async{
    statusRequest = StatusRequest.loading;
    var response = await updateInfoData.updateData(
        int.parse(MyServices.sharedPreferences.getString("id").toString()),
        firstName,
        lastName,
        email,
        mobile
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.back();
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    mobile = TextEditingController();

    firstName.text = MyServices.sharedPreferences.getString("first_name").toString();
    lastName.text = MyServices.sharedPreferences.getString("last_name").toString();
    email.text = MyServices.sharedPreferences.getString("email").toString();
    mobile.text = MyServices.sharedPreferences.getString("mobile").toString();
  }
}