import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/admin/core/utils/app_color.dart';
import 'package:libya_bakery/admin/handling_data/handlng_data_view.dart';
import 'package:libya_bakery/admin/presentation/screens/admin/screens/complain_container.dart';

import '../../../controller/complains/complains_controller.dart';
import '../../../core/utils/back_image.dart';
import '../../../core/utils/person.dart';
import '../menu.dart';

class ComplaintPage extends StatelessWidget {
  ComplaintPage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(ComplainsController());
    return Scaffold(
        backgroundColor: offwhite,
        key: scaffoldKey,
        endDrawer: Drawer(
          width: 250,
          child: AdminMenuScreen(),
        ),
        body: GetBuilder<ComplainsController>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Stack(children: [
                const BackGroundImage(),
                Column(children: [
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
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: .01 * MediaQuery.sizeOf(context).width,
                                ),
                                const Person(),
                                SizedBox(
                                  width: .03 * MediaQuery.sizeOf(context).width,
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.getComplains();
                                    },
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: yellow,
                                      size: 45,
                                    )),
                                SizedBox(
                                  width: .09 * MediaQuery.sizeOf(context).width,
                                ),
                                const Text(
                                  "الشكاوي",
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: yellow),
                                ),
                                SizedBox(
                                  width: .13 * MediaQuery.sizeOf(context).width,
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
                            height: .04 * MediaQuery.sizeOf(context).height,
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...List.generate(
                    controller.data.length,
                    (index) => ComplainsContainer(
                      controller: controller,
                      index: index,
                    ),
                  ),
                ]),
              ]));
        }));
  }
}
