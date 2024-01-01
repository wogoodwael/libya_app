import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/core/utils/person.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import 'package:libya_bakery/app/presentation/screens/orders/widgets/previous_order_container.dart';
import '../../../controller/orders/pending_controller.dart';
import '../../../core/utils/app_color.dart';
import '../../../handling_data/handlng_data_view.dart';
import '../cart/card_order.dart';

class PreviousOrdersScreen extends StatelessWidget {
  PreviousOrdersScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    PendingOrdersController pendingOrdersController =
        Get.put(PendingOrdersController());
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
            child: Column(children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: .18 * MediaQuery.sizeOf(context).height,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: .01 * MediaQuery.sizeOf(context).width,
                    ),
                    const Person(),
                    SizedBox(
                      width: .03 * MediaQuery.sizeOf(context).width,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => CartOrders());
                      },
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        size: 35,
                        color: yellow,
                      ),
                    ),
                    SizedBox(
                      width: .2 * MediaQuery.sizeOf(context).width,
                    ),
                    const Text(
                      "طلباتك ",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: yellow),
                    ),
                    SizedBox(
                      width: .1 * MediaQuery.sizeOf(context).width,
                    ),
                    //^ go to menu page
                    InkWell(
                      onTap: () {
                        pendingOrdersController.getOrders();
                      },
                      child: const Icon(
                        Icons.refresh,
                        size: 35,
                        color: yellow,
                      ),
                    ),
                    SizedBox(
                      width: .01 * MediaQuery.sizeOf(context).width,
                    ),
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
          GetBuilder<PendingOrdersController>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  ...List.generate(
                      controller.data.length,
                      (index) => Column(
                            children: [
                              SizedBox(
                                height: .03 * MediaQuery.sizeOf(context).height,
                              ),
                              PreviousOrderContainer(
                                listData: controller.data[index],
                              ),
                              const Divider(
                                thickness: 1,
                                color: green,
                                endIndent: 50,
                                indent: 50,
                              ),
                            ],
                          )),
                ],
              ),
            );
          })
        ]))
      ]),
    );
  }
}
