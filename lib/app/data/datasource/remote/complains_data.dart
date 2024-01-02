import '../../../api_connection/api_connection.dart';
import '../../../../../admin/core/class/crud.dart';

class ComplainsData {
  Crud crud;
  ComplainsData(this.crud);

  sendComplain(int userid, String complain, int branchCode) async{
    var response = await crud.postData(API.sendComplain, {
      "userid" : userid.toString(),
      "complain" : complain,
      "complainBranch" : branchCode.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  getComplains(int userid) async{
    var response = await crud.postData(API.viewComplains, {
      "userid" : userid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}