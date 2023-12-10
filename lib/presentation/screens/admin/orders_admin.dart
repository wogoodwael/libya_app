import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/presentation/screens/card/card_orders_admin.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class OrdersAdminScreen extends StatelessWidget {
  OrdersAdminScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: const Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      body: Stack(
        children: [
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
                        height: .06 * MediaQuery.sizeOf(context).height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: .01 * MediaQuery.sizeOf(context).width,
                          ),
                          Person(),

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
                                var scaffoldKey;
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
                          Icon(
                            Icons.arrow_forward,
                            size: 40,
                            color: yellow,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: .04 * MediaQuery.sizeOf(context).height,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        width: .3 * MediaQuery.sizeOf(context).width,
                        height: .04 * MediaQuery.sizeOf(context).height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: yellow,
                            ),
                            Text(
                              "إضافة منتج",
                              style: TextStyle(
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: yellow),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: darkGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(
                        width: .2 * MediaQuery.sizeOf(context).width,
                      ),
                      const Text(
                        "المنتجات",
                        style: TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: darkGreen),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CardOrdersAdminScreen(),
                Divider(
                  color: green,indent: 60, endIndent: 60, height: 60, thickness: 3,),
                 CardOrdersAdminScreen(),
                Divider(
                  color: green,indent: 60, endIndent: 60, height: 60, thickness: 3,),
                   CardOrdersAdminScreen(),
                Divider(
                  color: green,indent: 60, endIndent: 60, height: 60, thickness: 3,),
                   CardOrdersAdminScreen(),
                Divider(
                  color: green,indent: 60, endIndent: 60, height: 60, thickness: 3,),
                   CardOrdersAdminScreen(),
                Divider(
                  color: green,indent: 60, endIndent: 60, height: 60, thickness: 3,),
                   CardOrdersAdminScreen(),
                Divider(
                  color: green,indent: 60, endIndent: 60, height: 60, thickness: 3,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
