import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/core/utils/person.dart';
import 'package:libya_bakery/app/presentation/screens/categories/widgets/category_card.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';

import '../../../controller/home_controller.dart';
import '../../../core/utils/app_color.dart';
import '../../../handling_data/handlng_data_view.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      backgroundColor: offwhite,
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Stack(
                children: [
                  const BackGroundImage(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: .25 * MediaQuery.sizeOf(context).height,
                          decoration: const BoxDecoration(
                              color: darkGreen,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: .08 * MediaQuery.sizeOf(context).height,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: .01 * MediaQuery.sizeOf(context).width,
                                  ),
                                  const AppPerson(),
                                  const Icon(
                                    Icons.shopping_cart_rounded,
                                    size: 40,
                                    color: yellow,
                                  ),
                                  SizedBox(
                                    width: .12 * MediaQuery.sizeOf(context).width,
                                  ),
                                  const Text(
                                    "الاصناف",
                                    style: TextStyle(
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: yellow),
                                  ),
                                  SizedBox(
                                    width: .15 * MediaQuery.sizeOf(context).width,
                                  ),
                                  //^ go to menu page
                                  GestureDetector(
                                      onTap: () {
                                        scaffoldKey.currentState!.openEndDrawer();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 15),
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
                              SizedBox(
                                height: .04 * MediaQuery.sizeOf(context).height,
                              ),
                            ],
                          ),
                        ),
                        const CategoryCard()
                      ],
                    ),
                  )
                ],
              )
          );
        }
      ),
    );
  }
}
