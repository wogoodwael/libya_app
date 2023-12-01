import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/screens/orders/widgets/previous_order_container.dart';

class PreviousOrdersScreen extends StatelessWidget {
  PreviousOrdersScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                    height: .08 * MediaQuery.sizeOf(context).height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: .01 * MediaQuery.sizeOf(context).width,
                      ),
                      Person(),
                      SizedBox(
                        width: .03 * MediaQuery.sizeOf(context).width,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, cardOrders);
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
                        width: .2 * MediaQuery.sizeOf(context).width,
                      ),
                      //^ go to menu page
                      GestureDetector(
                          onTap: () {
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: .05 * MediaQuery.sizeOf(context).height,
            ),
            PreviousOrderContainer(
              status: ' تم الغاء الطلب ',
              colorStaus: Colors.red,
            ),
            SizedBox(
              height: .02 * MediaQuery.sizeOf(context).height,
            ),
            const Divider(
              thickness: 1,
              color: green,
              endIndent: 50,
              indent: 50,
            ),
            SizedBox(
              height: .02 * MediaQuery.sizeOf(context).height,
            ),
            PreviousOrderContainer(
              status: ' قيد التحضير   ',
              colorStaus: const Color.fromARGB(255, 127, 127, 127),
            ),
            SizedBox(
              height: .02 * MediaQuery.sizeOf(context).height,
            ),
            const Divider(
              thickness: 1,
              color: green,
              endIndent: 50,
              indent: 50,
            ),
            SizedBox(
              height: .02 * MediaQuery.sizeOf(context).height,
            ),
            PreviousOrderContainer(
              status: ' تم الاستلام ',
              colorStaus: green,
            ),
            SizedBox(
              height: .02 * MediaQuery.sizeOf(context).height,
            ),
            const Divider(
              thickness: 1,
              color: green,
              endIndent: 50,
              indent: 50,
            ),
            SizedBox(
              height: .02 * MediaQuery.sizeOf(context).height,
            ),
            PreviousOrderContainer(
              status: ' تم الاستلام ',
              colorStaus: green,
            ),
            SizedBox(
              height: .02 * MediaQuery.sizeOf(context).height,
            ),
            const Divider(
              thickness: 1,
              color: green,
              endIndent: 50,
              indent: 50,
            ),
            SizedBox(
              height: .02 * MediaQuery.sizeOf(context).height,
            ),
            PreviousOrderContainer(
              status: ' تم الاستلام ',
              colorStaus: green,
            ),
          ]))
        ]));
  }
}
