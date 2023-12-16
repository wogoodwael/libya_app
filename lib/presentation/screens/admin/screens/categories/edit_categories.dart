import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/categories/edit_controller.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/handling_data/handlng_data_view.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import '../../../../widgets/info_row.dart';
import '../../../../widgets/text_field.dart';

class EditCategories extends StatelessWidget {
  EditCategories({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesEditController());
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      body: GetBuilder<CategoriesEditController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: Stack(
                children: [
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
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Center(
                                  child: Text(
                                    "تعديل منتج",
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
                              padding: const EdgeInsets.only(right: 20),
                              child: InfoRow(
                                text: 'اسم المنتج',
                                fontsize: 17,
                                fontfamily: 'ArabicUIDisplayBold',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              controller: controller.name,
                              secure: false,
                              height: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: InfoRow(
                                text: 'التفاصيل ',
                                fontsize: 17,
                                fontfamily: 'ArabicUIDisplayBold',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              controller: controller.description,
                              secure: false,
                              height: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 150),
                              child: Text(
                                "تعديل/إضافة صورة",
                                style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: darkGreen),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    controller.chooseImage();
                                  },
                                  child: Container(
                                    width: .8 * MediaQuery.sizeOf(context).width,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: ExactAssetImage("assets/images/editphoto.png")),
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
                              height: 40,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    controller.editData();
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
                                        "تعديل",
                                        style: TextStyle(
                                          fontFamily: "ArabicUIDisplay",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: darkGreen,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ]),
                        ],
                      )),
                ],
              )
          );
        }
      ),
    );
  }
}
