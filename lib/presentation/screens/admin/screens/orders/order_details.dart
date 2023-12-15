// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: Drawer(
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
                        height: .1 * MediaQuery.sizeOf(context).height,
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
                            "الطلبات",
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
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    "تعديل الطلب",
                    style: TextStyle(
                        fontFamily: 'ArabicUIDisplay',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: darkGreen),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 40,
                      color: green,
                    ),
                  ),
                ]),
                const Divider(
                    color: darkGreen, indent: 10, endIndent: 10, thickness: 2),
                SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 200),
                  child: Text(
                    textAlign: TextAlign.end,
                    "تفاصيل الطلب",
                    style: TextStyle(
                        fontFamily: 'ArabicUIDisplay',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: darkGreen),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: .90 * MediaQuery.sizeOf(context).width,
                    height: .27 * MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 121, 119, 119),
                            blurRadius: 1.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 5),
                        const Text(
                          "x3    ________________________ خبزة سورية كبيره",
                          style: TextStyle(
                              color: green,
                              fontFamily: 'ArabicUIDisplayBold',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: .01 * MediaQuery.sizeOf(context).height,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 130,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove,
                                        color: darkGreen,
                                        size: 20,
                                      )),
                                  const Text(
                                    "3",
                                    style: TextStyle(
                                        color: darkGreen,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        color: darkGreen,
                                        size: 20,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: .3 * MediaQuery.sizeOf(context).width,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 2, bottom: 7),
                              child: Text(
                                " د.ل ",
                                style: TextStyle(
                                    color: darkGreen,
                                    fontSize: 20,
                                    fontFamily: 'ArabicUIDisplay',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                right: 1,
                              ),
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: darkGreen,
                                    fontSize: 17,
                                    fontFamily: 'ArabicUIDisplay',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: .0 * MediaQuery.sizeOf(context).height,
                        ),
                        const Text(
                          "x3    ________________________  توست ابيض كبير",
                          style: TextStyle(
                              color: green,
                              fontFamily: 'ArabicUIDisplayBold',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: .01 * MediaQuery.sizeOf(context).height,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 130,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove,
                                        color: darkGreen,
                                        size: 20,
                                      )),
                                  const Text(
                                    "3",
                                    style: TextStyle(
                                        color: darkGreen,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        color: darkGreen,
                                        size: 20,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: .3 * MediaQuery.sizeOf(context).width,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 2, bottom: 7),
                              child: Text(
                                " د.ل ",
                                style: TextStyle(
                                    color: darkGreen,
                                    fontSize: 20,
                                    fontFamily: 'ArabicUIDisplay',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                right: 1,
                              ),
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: darkGreen,
                                    fontSize: 17,
                                    fontFamily: 'ArabicUIDisplay',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          thickness: 2,
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 300,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: darkGreen,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  "إضافة منتج",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplay",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffbfed700),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "حالة الطلب",
                                style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: darkGreen),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: .5 * MediaQuery.sizeOf(context).width,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "قيد التحضير",
                                      style: TextStyle(
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: darkGreen),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 30,
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "كيفية الاستلام",
                                style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: darkGreen),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: .5 * MediaQuery.sizeOf(context).width,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "من المتجر",
                                      style: TextStyle(
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: darkGreen),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 30,
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Container(
                          width: .8 * MediaQuery.sizeOf(context).width,
                          height: 45,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5)
                            ],
                            color: darkGreen,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: const Center(
                            child: Text(
                              "عرض الفاتورة",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplay",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffbfed700),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          width: .8 * MediaQuery.sizeOf(context).width,
                          height: 45,
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 5)
                              ],
                              color: Color(0xffbFED700),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: const Center(
                            child: Text(
                              "حفظ",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplay",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: darkGreen,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
