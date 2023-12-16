import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/categories/add_controller.dart';
import 'package:libya_bakery/core/functions/uploadfile.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/handling_data/handlng_data_view.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/widgets/info_row.dart';
import 'package:libya_bakery/presentation/widgets/text_field.dart';

import '../../../../../core/helper/snack.dart';

class AddCategory extends StatelessWidget {
  AddCategory({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddController());
    return Scaffold(
        backgroundColor: offwhite,
        key: scaffoldKey,
        endDrawer: Drawer(
          width: 250,
          child: MenuScreen(),
        ),
        body: GetBuilder<CategoriesAddController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Stack(
                  children: [
                    const BackGroundImage(),
                    SingleChildScrollView(
                      child: Column(children: [
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
                                        var scaffoldKey;
                                        scaffoldKey.currentState!.openEndDrawer();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 15),
                                        child: Container(
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
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "إضافة صنف",
                                    style: TextStyle(
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: darkGreen),
                                  ),
                                ),
                                const SizedBox(
                                  width: 90,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    size: 40,
                                    color: green,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            const Divider(
                              endIndent: 9,
                              indent: 5,
                              color: darkGreen,
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20, bottom: 10),
                              child: InfoRow(
                                fontfamily: 'ArabicUIDisplayBold',
                                text: "اسم الصنف",
                                fontsize: 17,
                              ),
                            ),
                            CustomTextField(
                              controller: controller.name,
                              secure: false,
                              height: 35,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(right: 20, bottom: 10, top: 5),
                              child: InfoRow(
                                fontfamily: 'ArabicUIDisplayBold',
                                text: "التفاصيل ",
                                fontsize: 17,
                              ),
                            ),
                            CustomTextField(
                              maxLength: 25,
                              controller: controller.description,
                              secure: false,
                              height: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "إضافة صورة",
                                    style: TextStyle(
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: darkGreen),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Stack(
                              children: [
                                InkWell(
                                  onTap: (){
                                    controller.chooseImage();
                                  },
                                  child: Container(
                                    width: .8 * MediaQuery.sizeOf(context).width,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: ExactAssetImage(
                                                "assets/images/editphoto.png")),
                                        color: darkGreen,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 3,
                                            spreadRadius: 0.0,
                                            color: Colors.grey,
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    if(controller.file == null) showErrorSnack(context, "من فضلك اختار صورة");
                                    controller.addData();
                                  },
                                  child: Container(
                                    width: .8 * MediaQuery.sizeOf(context).width,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(color: Colors.grey, blurRadius: 5)
                                        ],
                                        color: Color(0xffbFED700),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: const Center(
                                      child: Text(
                                        "اضافة",
                                        style: TextStyle(
                                          fontFamily: "ArabicUIDisplay",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: darkGreen,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ]),
                    )
                  ],
                )
            );
          }
        ));
  }
}
