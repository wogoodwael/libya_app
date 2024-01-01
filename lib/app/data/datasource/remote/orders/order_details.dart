import '../../../../api_connection/api_connection.dart';
import '../../../../core/class/crud.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getData(int orderId) async{
    var response = await crud.postData(API.orderDetails, {
        "id" : orderId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}