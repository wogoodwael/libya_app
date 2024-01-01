import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/complains_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/complains_model.dart';
import '../../presentation/screens/admin/complaints.dart';

class ComplainsController extends GetxController{
  ComplainsData complainsData = ComplainsData(Get.find());
  List<ComplainsModel> data = [];
  late StatusRequest statusRequest;

  getComplains() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await complainsData.getComplains();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listData = response['data'];
        data.addAll(listData.map((e) => ComplainsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
        statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  goToComplainScreen(ComplainsModel complainsModel){
    Get.to(() => ComplaintsScreen(),
    arguments: {
      'complainsModel' : complainsModel
    });
  }

  @override
  void onInit() {
    super.onInit();
    getComplains();
  }

}