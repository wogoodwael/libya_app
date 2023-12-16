import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/categories/view_controller.dart';
import 'package:libya_bakery/core/functions/uploadfile.dart';
import 'package:libya_bakery/data/datasource/remote/categories_data.dart';
import 'package:libya_bakery/models/categories_model.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/categories/categories.dart';
import '../../core/functions/handling_data.dart';
import '../../handling_data/statusrequest.dart';

class CategoriesEditController extends GetxController{
  CategoriesData categoriesData = CategoriesData(Get.find());

  late TextEditingController name;
  late TextEditingController description;
  File? file;

  CategoriesModel? categoriesModel;

  StatusRequest? statusRequest = StatusRequest.none;

  chooseImage() async{
    file = await fileUploadGallery();
    update();
  }

  editData() async{
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      'id' : categoriesModel!.categoriesId!.toString(),
      'cat_name': name.text,
      'cat_description': description.text,
      'imageold' : categoriesModel!.categoriesImage!
    };
    var response = await categoriesData.editData(data, file);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == 'success'){
        Get.off(() => Categories());
        CategoriesViewController view = Get.find();
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    description = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    description.text = categoriesModel!.categoriesDescription!;
  }
}