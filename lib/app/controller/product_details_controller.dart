import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/cart_data.dart';
import '../models/items_model.dart';
import '../services/MyServices.dart';

abstract class ProductDetailsController extends GetxController{

}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countItems = 0;
  final Map<dynamic, dynamic> itemCounts = {}.obs;
  CartData cartData = CartData(Get.find());
  late dynamic itemsID;

  int getCountForItem(int itemId) {
    return itemCounts[itemId] ?? 0;
  }

  addToCart(itemId, itemName) async {
    statusRequest = StatusRequest.loading;
    update();
    itemsID = itemId ?? 0;
    var response = await cartData.addToCart(
        int.parse(MyServices.sharedPreferences.getString('id').toString()),
        itemId
    );
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    } else {
      if (StatusRequest.success == statusRequest) {
        // Check if the item is already in the cart
        final existingCount = itemCounts[itemId] ?? 0;
        // If the item is in the cart, increase its quantity
        itemCounts[itemId] = existingCount + 1;
        // Save the updated count to SharedPreferences
        MyServices.sharedPreferences.setInt(
            'item_count_$itemId', itemCounts[itemId] ?? 0);
        Get.rawSnackbar(title: 'Added Successfully',
            messageText: Text('$itemName has been added to your Cart list',
              style: const TextStyle(color: Colors.white),));
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  deleteFromCart(itemsId, itemName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteFromCart(
        int.parse(MyServices.sharedPreferences.getString('id').toString()),
        itemsId);
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    } else {
      if (StatusRequest.success == statusRequest) {
        final existingCount = itemCounts[itemsId] ?? 0;
        if (existingCount > 1) {
          itemCounts[itemsId] = existingCount - 1;
        } else {
          // If the quantity is 1, remove the item from the cart
          itemCounts.remove(itemsId);
        }
        // Save the updated count to SharedPreferences
        MyServices.sharedPreferences.setInt(
            'item_count_$itemsId', itemCounts[itemsId] ?? 0);
        Get.rawSnackbar(title: 'Deleted Successfully',
            messageText: Text(
              '$itemName has been deleted from your Cart list',
              style: const TextStyle(color: Colors.white),));
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  add() {
    addToCart(
        itemsModel.itemsId,
        itemsModel.itemsName);
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      deleteFromCart(
          itemsModel.itemsId,
          itemsModel.itemsName);
      countItems--;
      update();
    }
  }

  getCountItems(itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountItems(
        int.parse(MyServices.sharedPreferences.getString('id').toString()),
        itemsId);
    statusRequest = handlingData(response);
    if (response['status'] == 'failure') {
      statusRequest = StatusRequest.failure;
    } else {
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

  @override
  void onInit() {
    // Load item counts from SharedPreferences when the app starts
    for (final key in MyServices.sharedPreferences.getKeys()) {
      if (key.startsWith('item_count_')) {
        final itemId = int.parse(key.substring(11));
        final count = MyServices.sharedPreferences.getInt(key) ?? 0;
        itemCounts[itemId] = count;
      }
    }
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    clearCartCounts();
  }

  void clearCartCounts() {
    for (final key in MyServices.sharedPreferences.getKeys()) {
      for (int i = 0; i <= 26; i++) {
        if (key.startsWith('item_count_')) {
          MyServices.sharedPreferences.setInt('item_count_$i', 0);
        }
      }
      // update();
    }
    //TODO when checkout and when close app delete value of shared pref of cart count

  }
}