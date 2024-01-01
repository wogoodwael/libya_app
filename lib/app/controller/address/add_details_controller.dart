import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../admin/handling_data/statusrequest.dart';
import '../../../admin/presentation/screens/auth/otp/otp.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/address_data.dart';
import '../../presentation/screens/client/profile.dart';
import '../../services/MyServices.dart';

class AddressDetailsController extends GetxController{
  StatusRequest statusRequest = StatusRequest.loading;
  TextEditingController? name ;
  TextEditingController? city ;
  TextEditingController? street ;
  String? lat;
  String? long;
  AddressData addressData = AddressData(Get.find());

  initialData(){
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    statusRequest = StatusRequest.success;
    update();
    if (kDebugMode) {
      print(lat);
    }
    if (kDebugMode) {
      print(long);
    }
  }

  addAddress() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        int.parse(MyServices.sharedPreferences.getString('id').toString()),
        MyServices.sharedPreferences.getString("first_name").toString(),
        city!.text,
        street!.text,
        lat!,
        long!
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.offAll(() => const OtpScreen());
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  addAddressUser() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addDataUser(
        int.parse(MyServices.sharedPreferences.getString('id').toString()),
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.offAll(() => ProfileScreen());
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  editAddressUser(int addressId) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.editData(
        addressId,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.offAll(() => ProfileScreen());
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}