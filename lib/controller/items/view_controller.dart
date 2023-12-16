import 'package:get/get.dart';
import 'package:libya_bakery/data/datasource/remote/items_data.dart';
import 'package:libya_bakery/presentation/screens/admin/control.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/sub_categories/edit_sub_categories.dart';
import '../../core/functions/handling_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/items_model.dart';

class ItemsViewController extends GetxController{
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  getData() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.viewData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == 'success'){
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  deleteItem(int id, String imageName){
    itemsData.deleteData({
      'id': id.toString(),
      "imageName" : imageName
    });
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToEditPage(ItemsModel itemsModel){
    Get.to(() => EditSubCategoriesScreen(), arguments: {
      'itemsModel' : itemsModel
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