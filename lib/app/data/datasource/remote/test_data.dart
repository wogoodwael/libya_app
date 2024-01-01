import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async{
    var response = await crud.postData(API.login, {

    });
    return response.fold((l) => l, (r) => r);
  }
}