import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../api_connection/api_connection.dart';
import '../../../../controller/home_controller.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../models/categories_model.dart';

class CategoryCard extends GetView<HomeControllerImp> {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 600,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesModel:CategoriesModel.fromJson(controller.categories[index]),
            );
          },
        ),
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.categoriesModel, required this.i,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            controller.goToItems(
              controller.categories,
              i,
              categoriesModel.categoriesId!,
              categoriesModel,
            );
          },
          child: Card(
            elevation: 3,
            child: Container(
              width: .90 * MediaQuery.sizeOf(context).width,
              height: .22 * MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        spreadRadius: 1)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: .45 * MediaQuery.sizeOf(context).width,
                    height: .2 * MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                          child: Text(
                            categoriesModel.categoriesName!,
                            style: const TextStyle(
                                fontSize: 17,
                                color: yellow,
                                fontFamily: 'ArabicUIDisplay',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(right: 10, top: 5,bottom: 5),
                          child: Text(
                            categoriesModel.categoriesDescription!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 10),
                        //   child: Text(
                        //     "عدد المنتجات : ${controller.categories1Length.length}",
                        //     style: const TextStyle(
                        //         color: yellow,
                        //         fontFamily: 'ArabicUIDisplayBold',
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: 160,
                          height: 25,
                          decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              "عرض ",
                              style: TextStyle(
                                  color: green,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10,left: 15),
                    height: 150,
                    width: 135,
                    child: Image.network(
                      '${API.categoriesImages}/${categoriesModel.categoriesImage}',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 2,
          indent: 50,
          endIndent: 50,
          color: green,
        ),
        SizedBox(
          height: .03 * MediaQuery.sizeOf(context).height,
        ),
      ],
    );
  }
}

