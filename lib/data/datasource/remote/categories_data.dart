import 'dart:io';
import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  viewData() async{
    var response = await crud.postData(API.categoriesView,{});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async{
    var response = await crud.addRequestWithImageOne(
        API.categoriesAdd,
        data,
        file
    );
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data) async{
    var response = await crud.postData(API.categoriesEdit, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async{
    var response = await crud.postData(API.categoriesDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}