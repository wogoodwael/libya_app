import '../../../../api_connection/api_connection.dart';
import '../../../../core/class/crud.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData() async{
    var response = await crud.postData(API.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(int userId, int orderId) async{
    var response = await crud.postData(API.approveOrders, {
      "orderid" : orderId.toString(),
      "userid" : userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  archiveOrder(int userId, int orderId) async{
    var response = await crud.postData(API.archiveOrders, {
      "orderid" : orderId.toString(),
      "userid" : userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}