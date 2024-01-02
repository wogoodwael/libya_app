import '../../../api_connection/api_connection.dart';
import '../../../../../admin/core/class/crud.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  getData(int id, String branchCode) async{
    var response = await crud.postData(API.viewFavorite, {
      "id" : id.toString(),
      "branch_code" : branchCode
    }
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int id) async{
    var response = await crud.postData(API.deleteFavorite, {"id" : id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}