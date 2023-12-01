// ignore_for_file: non_constant_identifier_names

class SubCategoriesModel {
  final String items_name;
  final String items_desc;
  final String categories_name;
  final int categories_id;
  final int items_count;
  num? items_price;

  SubCategoriesModel(
      {required this.items_name,
      required this.items_desc,
      required this.categories_name,
      required this.items_count,
      required this.categories_id,
      this.items_price});

  factory SubCategoriesModel.fromJson(Map<String, dynamic> jsonData) {
    return SubCategoriesModel(
        items_name: jsonData['items_name'],
        items_desc: jsonData['items_desc'],
        categories_name: jsonData['categories_name'],
        items_count: jsonData['items_count'],
        items_price: jsonData['items_price'],
        categories_id: jsonData['categories_id']);
  }
}
