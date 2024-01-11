import 'package:libya_bakery/admin/data/services/api.dart';

import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class UserData {
  Crud crud;
  UserData(this.crud);

  viewData() async{
    var response = await crud.postData(API.userView,{});
    return response.fold((l) => l, (r) => r);
  }

  changeType(userType) async{
    var response = await crud.postData(API.userChangeType,{
      "type" : userType.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  changeFund(id , fund) async{
    var response = await crud.postData(API.userChangeFund,{
      "id" : id.toString(),
      "fund" : fund.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}