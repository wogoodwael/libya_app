import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});
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
            child: Column(children: [
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
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                    width: .9 * MediaQuery.sizeOf(context).width,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                alignment: Alignment.topCenter,
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "عرض",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplayBold",
                                    fontSize: 14,
                                    color: darkGreen,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "رقم الطلب : #00000",
                                style: TextStyle(
                                  fontFamily: "ArabicUIDisplayBold",
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: Text(
                            "الحالة : تم الاستلام",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Text(
                            "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
           SizedBox(height: 20,),
            Column(
                children: [
                  Container(
                    width: .9 * MediaQuery.sizeOf(context).width,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                alignment: Alignment.topCenter,
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "عرض",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplayBold",
                                    fontSize: 14,
                                    color: darkGreen,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "رقم الطلب : #00000",
                                style: TextStyle(
                                  fontFamily: "ArabicUIDisplayBold",
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 190),
                          child: Text(
                            "الحالة : تم إلغاء الطلب",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Text(
                            "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
           SizedBox(height: 20,),
            Column(
                children: [
                  Container(
                    width: .9 * MediaQuery.sizeOf(context).width,
                    height: 210,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                alignment: Alignment.topCenter,
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "عرض",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplayBold",
                                    fontSize: 14,
                                    color: darkGreen,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "رقم الطلب : #00000",
                                style: TextStyle(
                                  fontFamily: "ArabicUIDisplayBold",
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 190),
                          child: Text(
                            "الحالة : قيد التوصيل",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Text(
                            "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                        SizedBox(height: 5,),
                         Column(
            children: [
              Container(
                width: .8*MediaQuery.sizeOf(context).width,
                height: 35,
                decoration: const BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                            "إلغاء",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: offwhite,
                              ),
                  ),
                ),
              )
           
            ],
          ), 
           
                      ],
                    ),
                  ),
                  
                ],
              ),
           SizedBox(height: 20,),
            Column(
                children: [
                  Container(
                    width: .9 * MediaQuery.sizeOf(context).width,
                    height: 210,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                alignment: Alignment.topCenter,
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "عرض",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplayBold",
                                    fontSize: 14,
                                    color: darkGreen,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "رقم الطلب : #00000",
                                style: TextStyle(
                                  fontFamily: "ArabicUIDisplayBold",
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 190),
                          child: Text(
                            "الحالة : قيد التحضير",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Text(
                            "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                        SizedBox(height: 5,),
                         Column(
            children: [
              Container(
                width: .8*MediaQuery.sizeOf(context).width,
                height: 35,
                decoration: const BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                            "إلغاء",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: offwhite,
                              ),
                  ),
                ),
              )
           
            ],
          ), 
           
                      ],
                    ),
                  ),
                ],
              ),
          SizedBox(height: 20,),
            Column(
                children: [
                  Container(
                    width: .9 * MediaQuery.sizeOf(context).width,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                alignment: Alignment.topCenter,
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "عرض",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplayBold",
                                    fontSize: 14,
                                    color: darkGreen,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "رقم الطلب : #00000",
                                style: TextStyle(
                                  fontFamily: "ArabicUIDisplayBold",
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 180),
                          child: Text(
                            "الحالة : في إنتظار الموافقة",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Text(
                            "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: yellow,
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                        SizedBox(height: 5,),
                         Column(
            children: [
              Container(
                width: .8*MediaQuery.sizeOf(context).width,
                height: 35,
                decoration: const BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                            "قبول",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: offwhite,
                              ),
                  ),
                ),
              )
           
            ],
          ), 
                             SizedBox(height: 10,),
                         Column(
            children: [
              Container(
                width: .8*MediaQuery.sizeOf(context).width,
                height: 35,
                decoration: const BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                            "إلغاء",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: offwhite,
                              ),
                  ),
                ),
              )
           
            ],
          ), 
           
                      ],
                    ),
                  ),
                ],
              ),
          SizedBox(height: 30,),
            ],
            ),
          )
        ],
      ),
    );
  }
}
