import 'package:get/get.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../../admin/models/categories_model.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/test_data.dart';

class TestController extends GetxController{
  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  getData() async{
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == "success"){
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}