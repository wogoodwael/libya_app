import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/categories/view_controller.dart';
import 'package:libya_bakery/controller/items/view_controller.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/sub_categories/items.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/sub_categories/edit_sub_categories.dart';

import '../../../../../api_connection/api_connection.dart';

class ItemsContainer extends StatelessWidget {
  final ItemsViewController controller;
  final int index;
  const ItemsContainer({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            width: .97 * MediaQuery.sizeOf(context).width,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: .57 * MediaQuery.sizeOf(context).width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGreen,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: "تحذير",
                                      middleText: "هل انت متاكد انك تريد الحذف",
                                      onCancel: (){},
                                      onConfirm: (){
                                        controller.deleteItem(
                                            controller.data[index].itemsId!,
                                            controller.data[index].itemsImage!
                                        );
                                        Get.back();
                                      }
                                  );
                                },
                                child: Image.asset(
                                  "assets/images/delete.png",
                                  scale: 20,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.goToEditPage(controller.data[index]);
                                },
                                child: Image.asset(
                                  "assets/images/edit.png",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              controller.data[index].itemsName!,
                              style: const TextStyle(
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: yellow),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        controller.data[index].categoriesName!,
                        style: const TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: offwhite),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.data[index].itemsDate!,
                        style: const TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: offwhite),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${API.itemsImages}/${controller.data[index].itemsImage}"),
                          fit: BoxFit.cover),
                      color: yellow,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ],
      ),
      const Divider(
        indent: 50,
        endIndent: 50,
        color: darkGreen,
        thickness: 1,
        height: 50,
      )
    ]);
  }
}
