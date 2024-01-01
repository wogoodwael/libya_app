import '../../../../api_connection/api_connection.dart';
import '../../../../core/class/crud.dart';

class UserData {
  Crud crud;
  UserData(this.crud);

  getData(String email) async{
    var response = await crud.postData(API.fundData, {
      "user_email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}