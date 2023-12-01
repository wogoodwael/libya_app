class CategoriesModel {
  final int categoriesId;
  final String categoriesName;
  final String categoriesdescription;
   String? categoriesImage;
   String ?categoriesDatatime;

  CategoriesModel(
      {required this.categoriesId,
      required this.categoriesName,
       this.categoriesImage,
       this.categoriesDatatime, required this.categoriesdescription, });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
        categoriesId: json['categories_id'],
        categoriesName: json['categories_name'],
        categoriesImage: json['categories_image'],
        categoriesDatatime: json['categories_image'], categoriesdescription: json['categories_description']
        ,
        );
  }
}
