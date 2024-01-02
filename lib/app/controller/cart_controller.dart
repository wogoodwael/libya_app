import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/cart_data.dart';
import '../models/cart_model.dart';
import '../services/MyServices.dart';

class CartController extends GetxController{
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  double totalPrice = 0.0;
  int totalCountItems = 0;
  var branchCode = int.parse(MyServicesApp.sharedPreferences.getString("branch_code").toString());
  var userType = int.parse(MyServicesApp.sharedPreferences.getString("user_type").toString());



  addToCart(itemId,itemName) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addToCart(int.parse(MyServicesApp.sharedPreferences.getString('id').toString()), itemId);
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        Get.rawSnackbar(title: 'Added Successfully', messageText: Text('$itemName has been added to your Cart list',style: const TextStyle(color: Colors.white),));
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  deleteFromCart(itemsId,itemName) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteFromCart(int.parse(MyServicesApp.sharedPreferences.getString('id').toString()), itemsId);
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        Get.rawSnackbar(title: 'Deleted Successfully', messageText: Text('$itemName has been deleted from your Cart list',style: const TextStyle(color: Colors.white),));
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  getCountItems(itemsId) async{
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountItems(int.parse(MyServicesApp.sharedPreferences.getString('id').toString()), itemsId);
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        int countItems = 0;
        countItems = int.parse(response['data'].toString());
        if (kDebugMode) {
          print(countItems);
        }
        return countItems;
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getData(
        int.parse(MyServicesApp.sharedPreferences.getString('id').toString()),
      MyServicesApp.sharedPreferences.getString("branch_code").toString()
    );
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    }  else{
      if (StatusRequest.success == statusRequest) {
        if (response['datacart']['status'] == 'success') {
          List responseData = response['datacart']['data'];
          Map responseDataCountPrice = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalCountItems = int.parse(responseDataCountPrice['totalcount'].toString());
          branchCode == 1 && userType == 1
              ?
          totalPrice = double.parse(responseDataCountPrice['totalprice'].toString())
              :
          branchCode == 2 && userType == 1
              ?
          totalPrice = double.parse(responseDataCountPrice['totalprice2'].toString())
              :
          branchCode == 3 && userType == 1
              ?
          totalPrice = double.parse(responseDataCountPrice['totalprice3'].toString())
              :
          branchCode == 4 && userType == 1
              ?
          totalPrice = double.parse(responseDataCountPrice['totalprice4'].toString())
              :
          branchCode == 5 && userType == 1
              ?
          totalPrice = double.parse(responseDataCountPrice['totalprice5'].toString())
              :
          branchCode == 1 && userType == 2
              ?
          totalPrice = double.parse(responseDataCountPrice['totalshopownerprice'].toString())
              :
          branchCode == 2 && userType == 2
              ?
          totalPrice = double.parse(responseDataCountPrice['totalshopownerprice2'].toString())
              :
          branchCode == 3 && userType == 2
              ?
          totalPrice = double.parse(responseDataCountPrice['totalshopownerprice3'].toString())
              :
          branchCode == 4 && userType == 2
              ?
          totalPrice = double.parse(responseDataCountPrice['totalshopownerprice4'].toString())
              :
          branchCode == 5 && userType == 2
              ?
          totalPrice = double.parse(responseDataCountPrice['totalshopownerprice5'].toString())
              :
          branchCode == 1 && userType == 3
              ?
          totalPrice = double.parse(responseDataCountPrice['totalfornownerprice'].toString())
              :
          branchCode == 2 && userType == 3
              ?
          totalPrice = double.parse(responseDataCountPrice['totalfornownerprice2'].toString())
              :
          branchCode == 3 && userType == 3
              ?
          totalPrice = double.parse(responseDataCountPrice['totalfornownerprice3'].toString())
              :
          branchCode == 4 && userType == 3
              ?
          totalPrice = double.parse(responseDataCountPrice['totalfornownerprice4'].toString())
              :
          branchCode == 5 && userType == 3
              ?
          totalPrice = double.parse(responseDataCountPrice['totalfornownerprice5'].toString())
              :
          totalPrice = double.parse(responseDataCountPrice['totalprice'].toString());
        }
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  resetCart(){
    totalCountItems = 0;
    totalPrice = 0;
    data.clear();
  }

  refreshPage() {
    resetCart();
    getData();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}