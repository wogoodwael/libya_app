import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/user_controller.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/back_image.dart';
import '../../../../../core/utils/person.dart';
import '../../../../../handling_data/handlng_data_view.dart';
import '../../../../widgets/clients_body.dart';
import '../../../menu.dart';

class ClientScreen extends StatelessWidget {
  ClientScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(UserViewController());
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: AdminMenuScreen(),
      ),
      body: GetBuilder<UserViewController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Stack(children: [
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
                            height: .09 * MediaQuery.sizeOf(context).height,
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
                                  width: .12 * MediaQuery.sizeOf(context).width,
                                ),
                                const Text(
                                  "العملاء",
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // const UserTypeList(),
                    const SizedBox(
                      height: 20,
                    ),
                    ...List.generate(
                      controller.data.length,
                      (index) => ClientsBody(
                        controller: controller,
                        index: index,
                      ),
                    ),
                  ],
                ),
              ),
            ]));
      }),
    );
  }
}
