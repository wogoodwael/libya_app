import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/orders/accepted_controller.dart';
import 'package:libya_bakery/controller/orders/archive_controller.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/handling_data/handlng_data_view.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/acepted_order.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/recieved_order.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class OrderArchiveScreen extends StatelessWidget {
  OrderArchiveScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      body: GetBuilder<OrdersArchiveController>(
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
                            height: .22 * MediaQuery.sizeOf(context).height,
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
                                      width: .01 * MediaQuery.sizeOf(context).width,
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          controller.getOrders();
                                        },
                                        icon: const Icon(Icons.refresh,color: yellow,size: 45,)
                                    ),
                                    SizedBox(
                                      width: .02 * MediaQuery.sizeOf(context).width,
                                    ),
                                    const Text(
                                      "الطلبات المقبولة",
                                      style: TextStyle(
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: yellow
                                      ),
                                    ),
                                    SizedBox(
                                      width: .04 * MediaQuery.sizeOf(context).width,
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
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ...List.generate(
                            controller.data.length,
                                (index) =>  RecievedOrder(
                              controller: controller,
                              index: index,
                            ),
                          ),
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
