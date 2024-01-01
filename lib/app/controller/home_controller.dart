import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/home_data.dart';
import '../models/items_model.dart';
import '../presentation/screens/categories/sub_category.dart';
import '../presentation/screens/search_screen.dart';
import '../services/MyServices.dart';

abstract class HomeController extends SearchMixController{
  getData();
  goToItems(List categories, int selectedCat, int categoryid, categoriesModel);
}

class HomeControllerImp extends HomeController{
  @override
  HomeData homeData = HomeData(Get.find());
  var branchCode = int.parse(MyServices.sharedPreferences.getString("branch_code").toString());

  //list with all categories data (name - image - ...)
  List categories = [];

  //items on sale or new or most selled (items shown on home page)
  List items = [];

  @override
  getData() async{
    items.clear();
    categories.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData(
        branchCode.toString() ,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
    search = TextEditingController();
  }

  @override
  goToItems(categories, selectedCat, categoryid, categoriesModel) {
    Get.to(() => SubCategoryScreen(), arguments: {
      'categories': categories,
      'selectedCat': selectedCat,
      'categoryid' : categoryid,
      'categoriesModel' : categoriesModel,
    });
  }

  goToProducts(itemsModel){
    Get.to(() => SubCategoryScreen(), arguments: {
      'itemsModel' : itemsModel
    });
  }

}

class SearchMixController extends GetxController{
  late StatusRequest statusRequest;
  late StatusRequest statusRequestSearch;
  HomeData homeData = HomeData(Get.find());
  List<ItemsModel> list = [];

  searchData() async{
    statusRequestSearch = StatusRequest.loading;
    var response = await homeData.searchData(
        search!.text,
        MyServices.sharedPreferences.getString("branch_code").toString()
    );
    statusRequestSearch = handlingData(response);
    if (StatusRequest.success == statusRequestSearch) {
      if (response['status'] == 'success') {
        list.clear();
        List responseData = response['data'];
        list.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequestSearch = StatusRequest.failure;
      }
    }
    update();
  }

  TextEditingController? search;
  bool isSearch = false;

  checkSearch(val){
    if (val == '') {
      statusRequestSearch = StatusRequest.failure;
      isSearch = false;
    }
    update();
  }

  onSearchItems(){
    isSearch = true;
    searchData();
    Get.to(() =>const SearchScreen());

    update();
  }
}