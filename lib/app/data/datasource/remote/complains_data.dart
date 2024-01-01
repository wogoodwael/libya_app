import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class ComplainsData {
  Crud crud;
  ComplainsData(this.crud);

  sendReply(String email, String reply) async{
    var response = await crud.postData(API.sendReplyComplain, {
      "email" : email,
      "msg" : reply,
    });
    return response.fold((l) => l, (r) => r);
  }

  getComplains() async{
    var response = await crud.postData(API.viewAdminComplains, {});
    return response.fold((l) => l, (r) => r);
  }
}