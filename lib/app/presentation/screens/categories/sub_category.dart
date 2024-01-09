import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/utils/person.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/presentation/screens/cart/card_order.dart';
import 'package:libya_bakery/app/presentation/screens/favorite/widgets/custom_list_items.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import '../../../controller/favorite_controller.dart';
import '../../../controller/items_controller.dart';
import '../../../core/utils/app_color.dart';
import '../../../handling_data/handlng_data_view.dart';
import '../../../models/categories_model.dart';
import '../../../models/items_model.dart';

class SubCategoryScreen extends GetView<ItemsControllerImp> {
  SubCategoryScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.put(FavoriteController());
    Get.put(ItemsControllerImp());
    Map<String, dynamic> argumentsData = Get.arguments;
    CategoriesModel categoriesModel = argumentsData['categoriesModel'];
    return Scaffold(
        key: scaffoldKey,
        endDrawer: const Drawer(
          width: 250,
          child: MenuScreen(),
        ),
        backgroundColor: offwhite,
        body: Stack(children: [
          const BackGroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: .2 * MediaQuery.sizeOf(context).height,
                  decoration: const BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: .06 * MediaQuery.sizeOf(context).height,
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: .01 * MediaQuery.sizeOf(context).width,
                              ),
                              const AppPerson(),
                              SizedBox(
                                width: .03 * MediaQuery.sizeOf(context).width,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => CartOrders());
                                },
                                child: const Icon(
                                  Icons.shopping_cart_rounded,
                                  size: 40,
                                  color: yellow,
                                ),
                              ),
                              SizedBox(
                                width: .09 * MediaQuery.sizeOf(context).width,
                              ),
                              Text(
                                categoriesModel.categoriesName!,
                                style: const TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: yellow),
                              ),
                              SizedBox(
                                width: .13 * MediaQuery.sizeOf(context).width,
                              ),
                              //^ go to menu page
                              GestureDetector(
                                  onTap: () {
                                    scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SizedBox(
                                      width: 30,
                                      height: 25,
                                      child: Image.asset(
                                        "assets/images/icon_menu.png",
                                        color: yellow,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ]),
                ),
                GetBuilder<ItemsControllerImp>(builder: (controller) {
                  return HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            favoriteController.isFavorite[controller.data[index]
                                    ['items_id']] =
                                controller.data[index]['favorite'];
                            return CustomListItems(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]),
                            );
                          }));
                }),
              ],
            ),
          ),
          SizedBox(
            height: .05 * MediaQuery.sizeOf(context).height,
          ),
        ]));
  }
}
