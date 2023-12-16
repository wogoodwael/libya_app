import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/items/view_controller.dart';
import 'package:libya_bakery/core/functions/uploadfile.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/sub_categories/items.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/items_model.dart';

class ItemsEditController extends GetxController{
  ItemsData itemsData = ItemsData(Get.find());

  late TextEditingController name;
  late TextEditingController description;
  File? file;

  ItemsModel? itemsModel;

  StatusRequest? statusRequest = StatusRequest.none;

  chooseImage() async{
    file = await fileUploadGallery();
    update();
  }

  editData() async{
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      'id' : itemsModel!.itemsId!.toString(),
      'cat_name': name.text,
      'cat_description': description.text,
      'imageold' : itemsModel!.itemsImage!
    };
    var response = await itemsData.editData(data, file);
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
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController();
    description = TextEditingController();
    name.text = itemsModel!.itemsName!;
    description.text = itemsModel!.itemsDesc!;
  }
}