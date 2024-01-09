import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/helper/snack.dart';
import 'package:libya_bakery/app/core/utils/person.dart';
import 'package:libya_bakery/app/presentation/screens/categories/categories.dart';
import 'package:libya_bakery/app/presentation/screens/home/widgets/Items_list_home.dart';
import 'package:libya_bakery/app/presentation/screens/home/widgets/categories_list_home.dart';
import 'package:libya_bakery/app/presentation/screens/home/widgets/custom_row.dart';
import 'package:libya_bakery/app/presentation/screens/home/widgets/orders_container.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import 'package:libya_bakery/app/presentation/screens/orders/previous_orders.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/orders/pending_controller.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/back_image.dart';
import '../../../handling_data/handlng_data_view.dart';
import '../cart/card_order.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    PendingOrdersController pendingOrdersController =
        Get.put(PendingOrdersController());
    pendingOrdersController.getOrders();
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      backgroundColor: offwhite,
      body: GetBuilder<HomeControllerImp>(builder: (controller) {
        return Stack(children: [
          const BackGroundImage(),
          SingleChildScrollView(
              child: Column(children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: .30 * MediaQuery.sizeOf(context).height,
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
                        const Text(
                          "استكشف",
                          style: TextStyle(
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: yellow),
                        ),
                        SizedBox(
                          width: .13 * MediaQuery.sizeOf(context).width,
                        ),
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
                    height: .04 * MediaQuery.sizeOf(context).height,
                  ),
                  Container(
                    width: .85 * MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 3),
                      child: TextField(
                        controller: controller.search!,
                        onChanged: (val) {
                          // controller.checkSearch(val);
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ابحث عن منتج',
                            hintStyle: const TextStyle(
                              color: darkGreen,
                              fontFamily: 'ArabicUIDisplay',
                            ),
                            suffixIcon: IconButton(
                              color: darkGreen,
                              onPressed: () {
                                if (controller.search!.text == "") {
                                  showErrorSnack(
                                      context, "الرجاء إدخال اسم المنتج");
                                } else {
                                  controller.onSearchItems();
                                }
                              },
                              icon: const Icon(Icons.search),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: .05 * MediaQuery.sizeOf(context).height,
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    CustomRow(
                      ontap: () {
                        Get.to(() => CategoriesScreen());
                      },
                      text: 'الاصناف ',
                      widthOfSized: .45 * MediaQuery.sizeOf(context).width,
                      widthOfpadding: .02 * MediaQuery.sizeOf(context).width,
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    const Column(
                      children: [
                        CategoriesListHome(),
                      ],
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    const Divider(
                      thickness: 2,
                      color: darkGreen,
                      endIndent: 60,
                      indent: 60,
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    CustomRow(
                      ontap: () {
                        Get.to(() => CategoriesScreen());
                      },
                      text: 'العروض ',
                      widthOfSized: .45 * MediaQuery.sizeOf(context).width,
                      widthOfpadding: .02 * MediaQuery.sizeOf(context).width,
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    const ItemsListHome(),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    const Divider(
                      thickness: 2,
                      color: darkGreen,
                      endIndent: 60,
                      indent: 60,
                    ),
                  ],
                )),
            if (pendingOrdersController.data.isNotEmpty)
              GetBuilder<PendingOrdersController>(builder: (controllerpending) {
                return HandlingDataView(
                    statusRequest: controllerpending.statusRequest,
                    widget: Column(
                      children: [
                        CustomRow(
                          ontap: () {
                            Get.to(() => PreviousOrdersScreen());
                          },
                          text: 'طلباتك ',
                          widthOfSized: .46 * MediaQuery.sizeOf(context).width,
                          widthOfpadding:
                              .05 * MediaQuery.sizeOf(context).width,
                        ),
                        SizedBox(
                          height: .02 * MediaQuery.sizeOf(context).height,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              //* go to order details  page
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: ListView.builder(
                                    itemCount:
                                        pendingOrdersController.data.length,
                                    scrollDirection: Axis.horizontal,
                                    reverse: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        child: OrdersListCard(
                                            listData: pendingOrdersController
                                                .data[index]),
                                      );
                                    }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
          ]))
        ]);
      }),
    );
  }
}
