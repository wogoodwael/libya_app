import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/items/view_controller.dart';
import 'package:libya_bakery/core/functions/uploadfile.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../presentation/screens/admin/screens/sub_categories/items.dart';

class ItemsAddController extends GetxController{
  ItemsData itemsData = ItemsData(Get.find());

  late TextEditingController name;
  late TextEditingController description;
  late TextEditingController count;
  late TextEditingController itemPrice;
  late TextEditingController itemPrice2;
  late TextEditingController itemPrice3;
  late TextEditingController itemPrice4;
  late TextEditingController itemPrice5;
  late TextEditingController shopOwnerPrice;
  late TextEditingController shopOwnerPrice2;
  late TextEditingController shopOwnerPrice3;
  late TextEditingController shopOwnerPrice4;
  late TextEditingController shopOwnerPrice5;
  late TextEditingController fornOwnerPrice;
  late TextEditingController fornOwnerPrice2;
  late TextEditingController fornOwnerPrice3;
  late TextEditingController fornOwnerPrice4;
  late TextEditingController fornOwnerPrice5;
  late TextEditingController itemsDiscount;
  late TextEditingController shopOwnerDiscount;
  late TextEditingController fornOwnerDiscount;
  late TextEditingController branchCode;
  String? isItemAvailible = 'نعم';
  List<String> isItemAvailibleList = ['نعم','لا'];
  int? catID;
  File? file;

  StatusRequest? statusRequest = StatusRequest.none;

  showOptionImage(){
    showBottomMenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async{
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async{
    file = await fileUploadGallery(false);
    update();
  }

  addData() async{
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      'cat_name': name.text,
      'cat_description': description.text,
    };
    var response = await itemsData.addData(data, file!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == 'success'){
        Get.off(() => Items());
        ItemsViewController view = Get.find();
        view.getData();
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    description = TextEditingController();
    count = TextEditingController();
    itemPrice = TextEditingController();
    itemPrice2 = TextEditingController();
    itemPrice3 = TextEditingController();
    itemPrice4 = TextEditingController();
    itemPrice5 = TextEditingController();
    shopOwnerPrice = TextEditingController();
    shopOwnerPrice2 = TextEditingController();
    shopOwnerPrice3 = TextEditingController();
    shopOwnerPrice4 = TextEditingController();
    shopOwnerPrice5 = TextEditingController();
    fornOwnerPrice = TextEditingController();
    fornOwnerPrice2 = TextEditingController();
    fornOwnerPrice3 = TextEditingController();
    fornOwnerPrice4 = TextEditingController();
    fornOwnerPrice5 = TextEditingController();
    itemsDiscount = TextEditingController();
    shopOwnerDiscount = TextEditingController();
    fornOwnerDiscount = TextEditingController();
    branchCode = TextEditingController();
  }
}