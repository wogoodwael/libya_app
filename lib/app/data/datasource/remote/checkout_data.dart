import '../../../api_connection/api_connection.dart';
import '../../../../../admin/core/class/crud.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  getData(Map data) async{
    var response = await crud.postData(API.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
  deleteAllFromCart(int userId) async{
    var response = await crud.postData(API.deleteAllFromCart, {
      "user_id" : userId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

}