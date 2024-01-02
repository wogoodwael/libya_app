import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/favorite_data.dart';
import '../services/MyServices.dart';

class FavoriteController extends GetxController{
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  Map isFavorite = {};

  setFavorite(id, val){
    isFavorite[id] = val;
    update();
  }

  addFavorite(itemsId,itemName) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        int.parse(MyServicesApp.sharedPreferences.getString('id').toString()),
        itemsId,
        MyServicesApp.sharedPreferences.getString('branch_code').toString()
    );
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        Get.rawSnackbar(title: 'Added Successfully', messageText: Text('$itemName has been added to your favorites list',style: const TextStyle(color: Colors.white),));
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
  }

  removeFavorite(itemsId) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(int.parse(MyServicesApp.sharedPreferences.getString('id').toString()), itemsId);
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
  }
}