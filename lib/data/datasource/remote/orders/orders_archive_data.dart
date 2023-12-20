import '../../../../api_connection/api_connection.dart';
import '../../../../core/class/crud.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);

  getData() async {
    var response = await crud.postData(API.viewArchiveOrders, {});
    return response.fold((l) => l, (r) => r);
  }

}