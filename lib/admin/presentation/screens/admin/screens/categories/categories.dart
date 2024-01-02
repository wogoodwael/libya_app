import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/categories/view_controller.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/back_image.dart';
import '../../../../../core/utils/person.dart';
import '../../../../../handling_data/handlng_data_view.dart';
import '../../../menu.dart';
import 'add_category.dart';
import 'categories_container.dart';

class Categories extends StatelessWidget {
  Categories({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      body: GetBuilder<CategoriesViewController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: (){
                  return controller.myBack();
                },
                child: Stack(children: [
                  const BackGroundImage(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: .20 * MediaQuery.sizeOf(context).height,
                          decoration: const BoxDecoration(
                              color: darkGreen,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: .1 * MediaQuery.sizeOf(context).height,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: .01 * MediaQuery.sizeOf(context).width,
                                  ),
                                  const Person(),

                                  SizedBox(
                                    width: .12 * MediaQuery.sizeOf(context).width,
                                  ),
                                  const Text(
                                    "المنتجات",
                                    style: TextStyle(
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: yellow),
                                  ),
                                  SizedBox(
                                    width: .15 * MediaQuery.sizeOf(context).width,
                                  ),
                                  //* go to menu page
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
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      size: 40,
                                      color: yellow,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: .04 * MediaQuery.sizeOf(context).height,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AddCategory()));
                                },
                                child: Container(
                                  width: .3 * MediaQuery.sizeOf(context).width,
                                  height: .04 * MediaQuery.sizeOf(context).height,
                                  decoration: BoxDecoration(
                                    color: darkGreen,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.arrow_back,
                                        color: yellow,
                                      ),
                                      Text(
                                        "إضافة صنف",
                                        style: TextStyle(
                                            fontFamily: 'ArabicUIDisplay',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: yellow),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: .3 * MediaQuery.sizeOf(context).width,
                              ),
                              const Text(
                                "الاصناف",
                                style: TextStyle(
                                    fontFamily: 'ArabicUIDisplay',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: darkGreen),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ...List.generate(
                            controller.data.length,
                                (index) =>
                                    CategoriesContainer(
                                      controller: controller,
                                      index: index,
                                    )
                        ),
                      ],
                    ),
                  ),
                ]),
              )
          );
        }
      ),
    );
  }
}