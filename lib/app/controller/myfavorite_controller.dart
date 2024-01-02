import 'package:get/get.dart';
import 'package:libya_bakery/admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/myfavorite_data.dart';
import '../models/favorites_model.dart';
import '../services/MyServices.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  List<FavoriteModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData(
        int.parse(MyServicesApp.sharedPreferences.getString('id').toString()),
        MyServicesApp.sharedPreferences.getString('branch_code').toString()
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => FavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFav(favoriteId) {
    data.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
