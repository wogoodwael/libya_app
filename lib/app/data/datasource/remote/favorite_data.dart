import '../../../api_connection/api_connection.dart';
import '../../../../../admin/core/class/crud.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(int userId, int itemId, String branchCode) async {
    var response = await crud.postData(API.addFavorite, {
      'user_id': userId.toString(),
      'items_id': itemId.toString(),
      "branch_code": branchCode
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int userId, int itemId) async {
    var response = await crud.postData(API.removeFavorite,
        {'user_id': userId.toString(), 'items_id': itemId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
