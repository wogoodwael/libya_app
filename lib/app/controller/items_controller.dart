import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/items_data.dart';
import '../models/items_model.dart';
import '../presentation/screens/categories/sub_category.dart';
import '../services/MyServices.dart';
import 'home_controller.dart';

abstract class ItemsController extends SearchMixController{
  initialData();
  changeCat(int val, int catVal);
  getItems(int categoryid);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController{
  List categories = [];
  int? selectedCat;
  int? catId;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  @override
  late StatusRequest statusRequest;
  late ItemsModel itemsModel2;
  String branchCode = MyServices.sharedPreferences.getString('branch_code').toString();

  @override
  void onInit() {
    super.onInit();
    itemsModel2 = ItemsModel();
    initialData();
    search = TextEditingController();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['categoryid'];
    getItems(catId!);
  }

  @override
  changeCat(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  @override
  getItems(categoryid) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid,
        int.parse(MyServices.sharedPreferences.getString('id').toString()),
        branchCode
    );
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        data.addAll(response['data']);
        for (final key in MyServices.sharedPreferences.getKeys()) {
          for(int i = 0; i<=26;i++){
            if (key.startsWith('item_count_')) {
              MyServices.sharedPreferences.setInt('item_count_$i', 0);
            }
          }
        }
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  @override
  goToProductDetails(itemsModel){
    Get.to(SubCategoryScreen(),arguments: {'itemsModel' : itemsModel});
  }

}