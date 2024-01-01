import '../../../../api_connection/api_connection.dart';
import '../../../../core/class/crud.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(int orderId) async {
    var response = await crud.postData(API.orderDetails, {
      "id" : orderId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

}