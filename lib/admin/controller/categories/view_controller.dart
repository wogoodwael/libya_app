import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/categories_model.dart';
import '../../presentation/screens/admin/control.dart';
import '../../presentation/screens/admin/screens/categories/edit_categories.dart';

class CategoriesViewController extends GetxController{
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;

  getData() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
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

  deleteCategory(int id, String imageName){
    categoriesData.deleteData({
      'id': id.toString(),
      "imageName" : imageName
    });
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  goToEditPage(CategoriesModel categoriesModel){
    Get.to(() => EditCategories(), arguments: {
      'categoriesModel' : categoriesModel
    });
  }
  
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  myBack(){
    Get.offAll(() => ControlScreen());
    return Future.value(false);
  }
}