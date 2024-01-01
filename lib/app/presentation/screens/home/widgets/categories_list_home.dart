import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api_connection/api_connection.dart';
import '../../../../controller/home_controller.dart';
import '../../../../models/categories_model.dart';

class CategoriesListHome extends GetView<HomeControllerImp> {
  const CategoriesListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 160,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          scrollDirection: Axis.horizontal,
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
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
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              height: 120,
              width: 120,
              child: Image.network(
                '${API.categoriesImages}/${categoriesModel.categoriesImage}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            '${categoriesModel.categoriesName}',
            style: const TextStyle(
              fontFamily: 'ArabicUIDisplayBold',
            ),
          ),
          // Row(
          //   children: [
          //     const Text(
          //       'منتج ',
          //       style: TextStyle(
          //           color: Colors.blue,
          //         fontFamily: 'ArabicUIDisplayBold',
          //       ),
          //     ),
          //     Text(
          //       '${controller.categories2Length.length ?? 0}',
          //       style: const TextStyle(
          //         color: Colors.blue
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

