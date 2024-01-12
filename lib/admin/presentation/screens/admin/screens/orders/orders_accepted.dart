import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/orders/accepted_controller.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/back_image.dart';
import '../../../../../core/utils/person.dart';
import '../../../../../handling_data/handlng_data_view.dart';
import '../../../menu.dart';
import 'acepted_order.dart';

class OrderAcceptedScreen extends StatelessWidget {
  OrderAcceptedScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: const Drawer(
        width: 250,
        child: AdminMenuScreen(),
      ),
      body: GetBuilder<OrdersAcceptedController>(builder: (controller) {
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
                        height: .24 * MediaQuery.sizeOf(context).height,
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
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        .01 * MediaQuery.sizeOf(context).width,
                                  ),
                                  const Person(),
                                  SizedBox(
                                    width:
                                        .01 * MediaQuery.sizeOf(context).width,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.getOrders();
                                      },
                                      icon: const Icon(
                                        Icons.refresh,
                                        color: yellow,
                                        size: 45,
                                      )),
                                  SizedBox(
                                    width:
                                        .02 * MediaQuery.sizeOf(context).width,
                                  ),
                                  const Text(
                                    "الطلبات المقبولة",
                                    style: TextStyle(
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: yellow),
                                  ),
                                  SizedBox(
                                    width:
                                        .04 * MediaQuery.sizeOf(context).width,
                                  ),
                                  //* go to menu page
                                  GestureDetector(
                                      onTap: () {
                                        scaffoldKey.currentState!
                                            .openEndDrawer();
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ...List.generate(
                        controller.data.length,
                        (index) => AcceptedOrder(
                          controller: controller,
                          index: index,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
      }),
    );
  }
}
