import 'package:flutter/material.dart';
import 'package:libya_bakery/admin/presentation/screens/admin/screens/categories/categories.dart';
import 'package:libya_bakery/admin/presentation/screens/admin/screens/clients/clients.dart';
import 'package:libya_bakery/admin/presentation/screens/admin/screens/orders/order_screen.dart';
import 'package:libya_bakery/admin/presentation/screens/admin/screens/sub_categories/items.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/back_image.dart';
import '../../../core/utils/person.dart';
import '../menu.dart';
import 'complaint.dart';

class ControlScreen extends StatelessWidget {
  ControlScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: offwhite,
        key: scaffoldKey,
        endDrawer: Drawer(
          width: 250,
          child: AdminMenuScreen(),
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
                              width: .12 * MediaQuery.sizeOf(context).width,
                            ),
                            const Text(
                              "لوحة التحكم",
                              style: TextStyle(
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: yellow),
                            ),
                            SizedBox(
                              width: .15 * MediaQuery.sizeOf(context).width,
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
                      ),
                      SizedBox(
                        height: .04 * MediaQuery.sizeOf(context).height,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (_) => BillsScreen()));
                        //   },
                        //   child: Container(
                        //     width: 140,
                        //     height: 160,
                        //     decoration: const BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(20)),
                        //         color: darkGreen),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Image.asset("assets/images/bills.png"),
                        //         const SizedBox(
                        //           height: 10,
                        //         ),
                        //         const Text(
                        //           "الفواتير",
                        //           style: TextStyle(
                        //             fontFamily: 'ArabicUIDisplayBold',
                        //             fontSize: 20,
                        //             fontWeight: FontWeight.bold,
                        //             color: Color(0xffFFFFFF),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ClientScreen()));
                          },
                          child: Container(
                            width: 140,
                            height: 160,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: darkGreen),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/clients.png"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "العملاء",
                                  style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const OrderScreen()));
                          },
                          child: Container(
                            width: 140,
                            height: 160,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: darkGreen),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/orders.png"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "الطلبات",
                                  style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Categories())
                            );
                          },
                          child: Container(
                            width: 140,
                            height: 160,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: darkGreen),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/products.png"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "الاصناف",
                                  style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => ComplaintPage()));
                          },
                          child: Container(
                            width: 140,
                            height: 160,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: darkGreen),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/problems.png"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "الشكاوي",
                                  style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Items()));
                          },
                          child: Container(
                            width: 140,
                            height: 160,
                            decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                color: darkGreen),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/products.png"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "المنتجات",
                                  style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
