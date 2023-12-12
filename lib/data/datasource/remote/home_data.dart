import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData(String branchCode) async{
    var response = await crud.postData(API.home, {
      "branch_code" : branchCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search, String branchCode) async{
    var response = await crud.postData(API.search, {
      "search" : search,
      "branch_code" : branchCode
    });
    return response.fold((l) => l, (r) => r);
  }
}