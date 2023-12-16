import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/items/add_controller.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/handling_data/handlng_data_view.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

import '../../../../../core/functions/uploadfile.dart';
import '../../../../widgets/info_row.dart';
import '../../../../widgets/text_field.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddController());
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      body: GetBuilder<ItemsAddController>(builder: (controller) {
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
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Center(
                              child: Text(
                                " اضافة منتج",
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
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: 'العدد ',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.count,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج للمشتري العادي في فرع تاجوراء',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.itemPrice,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج للمشتري العادي في فرع عين زارة',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.itemPrice2,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج للمشتري العادي في فرع تربلس',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.itemPrice3,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج للمشتري العادي في فرع مصراتة',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.itemPrice4,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج للمشتري العادي في فرع الزاوية',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.itemPrice5,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب المحلات في فرع تاجوراء',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.shopOwnerPrice,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب المحلات في فرع عين زارة',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.shopOwnerPrice2,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب المحلات في فرع تربلس',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.shopOwnerPrice3,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب المحلات في فرع مصراتة',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.shopOwnerPrice4,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب المحلات في فرع الزاوية',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.shopOwnerPrice5,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب الافران في فرع تاجوراء',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.fornOwnerPrice,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب الافران في فرع عين زارة',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.fornOwnerPrice2,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب الافران في فرع تربلس',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.fornOwnerPrice3,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب الافران في فرع مصراتة',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.fornOwnerPrice4,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' سعر المنتج لاصحاب الافران في فرع الزاوية',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.fornOwnerPrice5,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' الخصم للمشتري العادي (ان لم يوجد اكتب 0)',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.itemsDiscount,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' الخصم لاصحاب المحلات (ان لم يوجد اكتب 0)',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.shopOwnerDiscount,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: ' الخصم لاصحاب الافران (ان لم يوجد اكتب 0)',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.fornOwnerDiscount,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 180),
                          child: Text(
                            "إضافة صورة",
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
                              onTap: () {
                                controller.showOptionImage();
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
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 180),
                          child: Text(
                            "هل المنتج متوفر؟",
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
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Container(
                            width: 200,
                            height: context.height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black),
                            ),
                            child: DropdownButton<String>(
                              value: controller.isItemAvailible,
                              isExpanded: true,
                              items: controller.isItemAvailibleList
                                  .map((idType) => DropdownMenuItem<String>(
                                      value: idType,
                                      child: Text(
                                        idType,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      )))
                                  .toList(),
                              isDense: true,
                              underline: Container(
                                height: 0,
                              ),
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.black,
                              padding: const EdgeInsets.all(12),
                              onChanged: (idType) => setState(() {
                                controller.isItemAvailible = idType!;
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InfoRow(
                            text: 'المنتج يوجد باي فرع؟ (مثال: 1245)',
                            fontsize: 17,
                            fontfamily: 'ArabicUIDisplayBold',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.branchCode,
                          secure: false,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                controller.addData();
                              },
                              child: Container(
                                width: .8 * MediaQuery.sizeOf(context).width,
                                height: 45,
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(color: Colors.grey, blurRadius: 5)
                                    ],
                                    color: Color(0xffbfed700),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: const Center(
                                  child: Text(
                                    "إضافة",
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
                ),
              ],
            ));
      }),
    );
  }
}
