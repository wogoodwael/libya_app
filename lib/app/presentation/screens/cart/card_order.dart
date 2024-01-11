import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/core/utils/person.dart';
import 'package:libya_bakery/app/presentation/screens/home/home.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import 'package:libya_bakery/app/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/app/services/MyServices.dart';
import '../../../../admin/core/utils/app_color.dart';
import '../../../controller/address/view_controller.dart';
import '../../../controller/cart_controller.dart';
import '../../../handling_data/handlng_data_view.dart';
import 'widgets/card_items_count.dart';
import 'confirm_order.dart';
import 'widgets/custom_cart_items_list.dart';

class CartOrders extends StatefulWidget {
  const CartOrders({super.key});

  @override
  State<CartOrders> createState() => _CartOrdersState();
}

class _CartOrdersState extends State<CartOrders> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    AddressViewController addressViewController =
        Get.put(AddressViewController());
    var branchCode = int.parse(
        MyServicesApp.sharedPreferences.getString("branch_code").toString());
    var userType = int.parse(
        MyServicesApp.sharedPreferences.getString("user_type").toString());
    return WillPopScope(
      onWillPop: () {
        Get.offAll(const HomeScreen());
        return Future.value(true);
      },
      child: Scaffold(
          bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) {
              return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                      width: .90 * MediaQuery.sizeOf(context).width,
                      height: .21 * MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 121, 119, 119),
                              blurRadius: 1.0,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${cartController.totalPrice.toStringAsFixed(2)} د.ل',
                                  style: const TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "المجموع",
                                  style: TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: .01 * MediaQuery.sizeOf(context).height,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "0.00 د.ل",
                                  style: TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "اجمالي التوصيل",
                                  style: TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: .01 * MediaQuery.sizeOf(context).height,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${cartController.totalPrice.toStringAsFixed(2)} د.ل',
                                  style: const TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "اجمالي الفاتورة",
                                  style: TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: .001 * MediaQuery.sizeOf(context).height,
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: .01 * MediaQuery.sizeOf(context).height,
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (controller.data.isEmpty) {
                                    Get.snackbar("خطأ", "سلة التسوق فارغة",
                                        backgroundColor: green,
                                        snackStyle: SnackStyle.FLOATING);
                                  } else if (addressViewController
                                      .data.isEmpty) {
                                    Get.snackbar("خطأ", "الرجاء إضافة عنوان",
                                        backgroundColor: green,
                                        snackStyle: SnackStyle.FLOATING);
                                  } else {
                                    Get.to(() => const ConfirmOrders(),
                                        arguments: {
                                          "priceorder": cartController
                                              .totalPrice
                                              .toString()
                                        });
                                  }
                                },
                                child: CustomNext(text: 'التالي')),
                          ],
                        ),
                      )));
            },
          ),
          key: scaffoldKey,
          endDrawer: const Drawer(
            width: 250,
            child: MenuScreen(),
          ),
          backgroundColor: offwhite,
          body: GetBuilder<CartController>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Stack(children: [
                const BackGroundImage(),
                Column(
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
                            height: .06 * MediaQuery.sizeOf(context).height,
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width:
                                      .055 * MediaQuery.sizeOf(context).width,
                                ),
                                const AppPerson(),
                                SizedBox(
                                  width: .08 * MediaQuery.sizeOf(context).width,
                                ),
                                const Text(
                                  "سلة المشتريات",
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: yellow),
                                ),
                                SizedBox(
                                  width: .12 * MediaQuery.sizeOf(context).width,
                                ),
                                //* go to menu page
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
                          SizedBox(
                            height: .03 * MediaQuery.sizeOf(context).height,
                          ),
                          CartItemsCount(
                              message:
                                  ' لديك ${cartController.totalCountItems} منتجات في السلة'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: .01 * MediaQuery.sizeOf(context).height,
                    ),
                    //*  order  cart
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                          width: .90 * MediaQuery.sizeOf(context).width,
                          height: .50 * MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 121, 119, 119),
                                  blurRadius: 1.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      .01 * MediaQuery.sizeOf(context).height,
                                ),
                                const Divider(
                                  thickness: 2,
                                  color: yellow,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                ...List.generate(
                                    cartController.data.length,
                                    (index) => CustomCartItemsList(
                                          onAdd: () async {
                                            await cartController.addToCart(
                                                cartController
                                                    .data[index].itemsId,
                                                cartController
                                                    .data[index].itemsName);
                                            cartController.refreshPage();
                                          },
                                          onRemove: () async {
                                            await cartController.deleteFromCart(
                                                cartController
                                                    .data[index].itemsId,
                                                cartController
                                                    .data[index].itemsName);
                                            cartController.refreshPage();
                                          },
                                          name:
                                              "${cartController.data[index].itemsName}",
                                          price: branchCode == 1 &&
                                                  userType == 1
                                              ? (cartController
                                                      .data[index].itemsprice)!
                                                  .toStringAsFixed(2)
                                              : branchCode == 2 && userType == 1
                                                  ? (cartController.data[index]
                                                          .itemsprice2)!
                                                      .toStringAsFixed(2)
                                                  : branchCode == 3 &&
                                                          userType == 1
                                                      ? (cartController
                                                              .data[index]
                                                              .itemsprice3)!
                                                          .toStringAsFixed(2)
                                                      : branchCode == 4 &&
                                                              userType == 1
                                                          ? (cartController
                                                                  .data[index]
                                                                  .itemsprice4)!
                                                              .toStringAsFixed(
                                                                  2)
                                                          : branchCode == 5 &&
                                                                  userType == 1
                                                              ? (cartController
                                                                      .data[index]
                                                                      .itemsprice5)!
                                                                  .toStringAsFixed(2)
                                                              : branchCode == 1 && userType == 2
                                                                  ? (cartController.data[index].shopownerprice)!.toStringAsFixed(2)
                                                                  : branchCode == 2 && userType == 2
                                                                      ? (cartController.data[index].shopownerprice2)!.toStringAsFixed(2)
                                                                      : branchCode == 3 && userType == 2
                                                                          ? (cartController.data[index].shopownerprice3)!.toStringAsFixed(2)
                                                                          : branchCode == 4 && userType == 2
                                                                              ? (cartController.data[index].shopownerprice4)!.toStringAsFixed(2)
                                                                              : branchCode == 5 && userType == 2
                                                                                  ? (cartController.data[index].shopownerprice5)!.toStringAsFixed(2)
                                                                                  : branchCode == 1 && userType == 3
                                                                                      ? (cartController.data[index].fornownerprice)!.toStringAsFixed(2)
                                                                                      : branchCode == 2 && userType == 3
                                                                                          ? (cartController.data[index].fornownerprice2)!.toStringAsFixed(2)
                                                                                          : branchCode == 3 && userType == 3
                                                                                              ? (cartController.data[index].fornownerprice3)!.toStringAsFixed(2)
                                                                                              : branchCode == 4 && userType == 3
                                                                                                  ? (cartController.data[index].fornownerprice4)!.toStringAsFixed(2)
                                                                                                  : branchCode == 5 && userType == 3
                                                                                                      ? (cartController.data[index].fornownerprice5)!.toStringAsFixed(2)
                                                                                                      : (cartController.data[index].itemsprice)!.toStringAsFixed(2),
                                          count:
                                              "${cartController.data[index].countitems}",
                                          image:
                                              '${cartController.data[index].itemsImage}',
                                          discount:
                                              '${cartController.data[index].itemsDiscount}',
                                        )),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ]),
            );
          })),
    );
  }
}
