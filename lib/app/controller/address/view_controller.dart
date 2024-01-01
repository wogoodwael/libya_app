import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../admin/handling_data/statusrequest.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/address_data.dart';
import '../../models/address_model.dart';
import '../../services/MyServices.dart';

class AddressViewController extends GetxController{
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];
  late StatusRequest statusRequest;

  deleteAddress(int addressId){
    try {
      addressData.deleteData(addressId);
      data.removeWhere((element) => element.addressId == addressId);
      update();
    }catch(e){
      if (kDebugMode) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  getData() async{
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(int.parse(MyServices.sharedPreferences.getString('id').toString()));
    statusRequest = handlingData(response);
    try {
      if (response['status'] == 'failure') {
        statusRequest = StatusRequest.failure;
      } else {
        if (StatusRequest.success == statusRequest) {
          List listData = response['data'];
          data.addAll(listData.map((e) => AddressModel.fromJson(e)));
          if(data.isEmpty){
            statusRequest = StatusRequest.failure;
          }
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.serverfailure;
        }
      }
    }catch(e){
      if (kDebugMode) {
        print("error $e");
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}