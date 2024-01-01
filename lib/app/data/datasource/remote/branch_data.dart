import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class BranchData {
  Crud crud;
  BranchData(this.crud);

  chooseBranch(int userId, int branchCode) async{
    var response = await crud.postData(API.chooseBranch, {
      "userid" : userId.toString(),
      "branchcode" : branchCode.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}