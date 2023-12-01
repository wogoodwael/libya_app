import 'dart:convert';

import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/data/models/sub_categ_model.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/data/services/api.dart';

class SubCategorieServices {
  Future<List<SubCategoriesModel>> getSubCategories() async {
    String url = items;
    http.Response response = await http.post(Uri.parse(url), body: {
      'id': MyServices.sharedPreferences.getString('cat_id'),
      'user_id': MyServices.sharedPreferences.getString('id'),
      'branch_code': MyServices.sharedPreferences.getString('branch_code')
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> subCategories = data['data'];
    List<SubCategoriesModel> subCategoriesList = [];
    for (var element in subCategories) {
      SubCategoriesModel subCategoriesModel = SubCategoriesModel(
          items_name: element['items_name'],
          items_desc: element['items_desc'],
          categories_name: element['categories_name'],
          items_count: element['items_count'],
          items_price: element['items_price'],
          categories_id: element['categories_id']);
      subCategoriesList.add(subCategoriesModel);
    }

    if (response.statusCode == 200) {
      print("success response ");
      if (data['status'] == 'success') {
        print("sucess data");
      } else {
        print("ca not read data");
      }
    } else {
      print(response.statusCode.toString());
    }
    print("****************${subCategoriesList}");
    return subCategoriesList;
  }
}
