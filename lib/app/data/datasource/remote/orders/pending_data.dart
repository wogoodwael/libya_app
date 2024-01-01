import '../../../../api_connection/api_connection.dart';
import '../../../../core/class/crud.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);

  getData(int userId) async{
    var response = await crud.postData(API.pendingOrders, {
      "userid" : userId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}