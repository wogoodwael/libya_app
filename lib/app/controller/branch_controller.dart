import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/functions/handling_data.dart';
import '../core/utils/app_color.dart';
import '../data/datasource/remote/branch_data.dart';
import '../data/services/api.dart';
import '../handling_data/statusrequest.dart';
import '../presentation/screens/admin/control.dart';
import 'home_controller.dart';

class BranchController extends GetxController{
  BranchData branchData = BranchData(Get.find());
  HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  late StatusRequest statusRequest;

  chooseBranch(int branchCode) async{
    if(branchCode.toString() == MyServices.sharedPreferences.getString("branch_code")){
      Get.back();
      Get.snackbar(
          "",
          "",
          titleText: const Text("خطأ",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'ArabicUIDisplayBold',),),
          messageText: const Text( "أنت في هذا الفرع",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18,fontFamily: 'ArabicUIDisplayBold',)),
          backgroundColor: Colors.red
      );
    } else {
      statusRequest = StatusRequest.loading;
      var response = await branchData.chooseBranch(int.parse(MyServices.sharedPreferences.getString('id').toString()),branchCode);
      statusRequest = handlingData(response);
      if (response['status'] == 'failure') {
        statusRequest = StatusRequest.failure;
      }  else{
        if (StatusRequest.success == statusRequest) {
          MyServices.sharedPreferences.setString('branch_code', '$branchCode');
          homeControllerImp.items.clear();
          homeControllerImp.categories.clear();
          homeControllerImp.getData();
          Get.offAll(() => ControlScreen());
          Get.snackbar(
              "",
              "",
              titleText: const Text("نجاح",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'ArabicUIDisplayBold',),),
              messageText: const Text( "تم تغيير الفرع بنجاح",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18,fontFamily: 'ArabicUIDisplayBold',)),
              backgroundColor: green
          );
        } else {
          statusRequest = StatusRequest.serverfailure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    statusRequest = StatusRequest.success;
  }
}