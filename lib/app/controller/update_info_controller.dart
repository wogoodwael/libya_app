import 'package:get/get.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/update_info_data.dart';
import '../services/MyServices.dart';

class UpdateInfoController extends GetxController{
  UpdateInfoData updateInfoData = UpdateInfoData(Get.find());
  late StatusRequest statusRequest;

  updateUserInfo(String firstName, String lastName, String email, String mobile) async{
    statusRequest = StatusRequest.loading;
    var response = await updateInfoData.updateData(
        int.parse(MyServicesApp.sharedPreferences.getString("id").toString()),
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

}