import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class UpdateInfoData {
  Crud crud;
  UpdateInfoData(this.crud);

  updateData(int userId,String firstName, String lastName, String email, String mobile) async{
    var response = await crud.postData(API.updateInfo, {
      "userid" : userId.toString(),
      "firstname" : firstName,
      "lastname" : lastName,
      "email" : email,
      "mobile" : mobile,
    });
    return response.fold((l) => l, (r) => r);
  }
}