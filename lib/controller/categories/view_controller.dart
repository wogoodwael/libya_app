import 'package:get/get.dart';
import 'package:libya_bakery/data/datasource/remote/categories_data.dart';
import '../../core/functions/handling_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/categories_model.dart';

class CategoriesViewController extends GetxController{
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;

  getData() async{
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.viewData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == 'success'){
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