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

  editData(Map data, [File? file]) async{
    var response;
    if(file == null){
      response = await crud.postData(API.categoriesEdit, data);
    } else {
      response = await crud.addRequestWithImageOne(API.categoriesEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async{
    var response = await crud.postData(API.categoriesDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}