import 'dart:io';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/admin/controller/items/view_controller.dart';
import '../../core/functions/handling_data.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../handling_data/statusrequest.dart';
import '../../models/categories_model.dart';
import '../../presentation/screens/admin/screens/sub_categories/items.dart';

class ItemsAddController extends GetxController{
  ItemsData itemsData = ItemsData(Get.find());

  List<SelectedListItem> dropDownList = [];
  List<SelectedListItem> branchDropDownList = [
    SelectedListItem(name: "1",value: "1",),
    SelectedListItem(name: "2",value: "2",),
    SelectedListItem(name: "3",value: "3",),
    SelectedListItem(name: "4",value: "4",),
    SelectedListItem(name: "5",value: "5",),
  ];

  late TextEditingController dropDownName;
  late TextEditingController dropDownId;
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
  late TextEditingController? catID;
  late TextEditingController catName;
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

  showDropDown(context){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "اختر الفئة",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'تم',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data:  [SelectedListItem(name: "a",),SelectedListItem(name: "a",)],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropDownName.text = selectedListItem.name;
          // showSnackBar(list.toString());
        },
        // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  getCategories() async{
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.viewData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == 'success'){
        List<CategoriesModel> data = [];
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));

        for(int i=0;i<data.length;i++){
          dropDownList.add(SelectedListItem(
              name: data[i].categoriesName!,
              value: data[i].categoriesId.toString()
          )
          );
        }
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  addData() async{
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      'name': name.text,
      'desc': description.text,
      'count': count.text,
      'itemsprice': itemPrice.text,
      'itemsprice2': itemPrice2.text,
      'itemsprice3': itemPrice3.text,
      'itemsprice4': itemPrice4.text,
      'itemsprice5': itemPrice5.text,
      'shopownerprice': shopOwnerPrice.text,
      'shopownerprice2': shopOwnerPrice2.text,
      'shopownerprice3': shopOwnerPrice3.text,
      'shopownerprice4': shopOwnerPrice4.text,
      'shopownerprice5': shopOwnerPrice5.text,
      'fornownerprice': fornOwnerPrice.text,
      'fornownerprice2': fornOwnerPrice2.text,
      'fornownerprice3': fornOwnerPrice3.text,
      'fornownerprice4': fornOwnerPrice4.text,
      'fornownerprice5': fornOwnerPrice5.text,
      'itemsdiscount': itemsDiscount.text,
      'shopownerdiscount': shopOwnerDiscount.text,
      'fornownerdicount': fornOwnerDiscount.text,
      'catid': catID!.text,
      'branchcode': branchCode.text,
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
    getCategories();
    dropDownName = TextEditingController();
    dropDownId = TextEditingController();
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
    catName = TextEditingController();
    catID = TextEditingController();
  }
}