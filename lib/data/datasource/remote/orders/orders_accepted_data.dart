import '../../../../api_connection/api_connection.dart';
import '../../../../core/class/crud.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(API.viewAcceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(int orderId, int userId, int orderType) async {
    var response = await crud.postData(API.prepareOrders, {
      "orderId" : orderId.toString(),
      "userId" : userId.toString(),
      "orderType" : orderType.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  archiveOrder2(int userId, int orderId) async{
    var response = await crud.postData(API.archiveOrders2, {
      "orderid" : orderId.toString(),
      "userid" : userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

}