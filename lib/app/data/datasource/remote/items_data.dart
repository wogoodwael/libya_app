import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(int id , int userId, String branchCode) async{
    var response = await crud.postData(API.items, {
      'id' : id.toString(),
      'user_id': userId.toString(),
      "branch_code" : branchCode
    }
    );
    return response.fold((l) => l, (r) => r);
  }
}