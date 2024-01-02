import '../../../api_connection/api_connection.dart';
import '../../../../../admin/core/class/crud.dart';

class  CartData {
  Crud crud;
  CartData(this.crud);

  addToCart(int userId , int itemId) async{
    var response = await crud.postData(API.addItemToCart, {
      'user_id': userId.toString(),
      "items_id": itemId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFromCart(int userId , int itemId) async{
    var response = await crud.postData(API.deleteFromCart, {
      'user_id' : userId.toString(),
      'items_id': itemId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountItems(int userId , int itemId) async{
    var response = await crud.postData(API.getCountItems, {
      'userid' : userId.toString(),
      'itemid': itemId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  getData(id, String branchCode) async{
    var response = await crud.postData(API.cartView, {
      'id' : id.toString(),
      "branch_code" : branchCode
    });
    return response.fold((l) => l, (r) => r);
  }
}