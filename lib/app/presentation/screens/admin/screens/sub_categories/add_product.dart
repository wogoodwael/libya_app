import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/items/add_controller.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/back_image.dart';
import '../../../../../core/utils/person.dart';
import '../../../../../handling_data/handlng_data_view.dart';
import '../../../../widgets/custom_drop_down_search.dart';
import '../../../../widgets/info_row.dart';
import '../../../../widgets/text_field.dart';
import '../../../menu.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

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
                          isNumber: false,
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
                          isNumber: false,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          isNumber: true,
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
                          height: 10,
                        ),
                        if(controller.file != null)
                          Image.file(controller.file!, width: 100, height: 100,),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 180),
                          child: Text(
                            "فئة المنتج",
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
                        CustomDropDownSearch(
                          isMultiple: false,
                          title: "اختار القائمة ",
                          listData: controller.dropDownList,
                          dropDownSelectedName: controller.catName,
                          dropDownSelectedId: controller.catID,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 180),
                          child: Text(
                            "هذا المنتج في أي فرع؟",
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
                        CustomDropDownSearch(
                          isMultiple: true,
                          title: "اختر الفرع ",
                          listData: controller.branchDropDownList,
                          dropDownSelectedName: controller.branchCode,
                          dropDownSelectedId: controller.branchCode,
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
