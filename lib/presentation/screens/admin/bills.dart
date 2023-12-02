import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class BillsScreen extends StatelessWidget {
  BillsScreen({super.key});
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
                          "الفواتير",
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
             SizedBox(height: 20,),
            Column(
                children: [
                  Container(
                    width: .9 * MediaQuery.sizeOf(context).width,
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        
                        const SizedBox(
                          width: 90,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 150,bottom: 10 ,top: 10),
                          child: Text(
                            "رقم الفاتورة : #00000",
                            style: TextStyle(
                              fontFamily: "ArabicUIDisplayBold",
                              fontWeight: FontWeight.bold,
                              color: darkGreen,
                            ),
                          ),
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
                            "xxxx : رقم الطلب",
                            style: TextStyle(
                              color: darkGreen,
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200),
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
                          height: 10,
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
                          height: 10,
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
                  color: yellow,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                            "عرض الفاتورة",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: darkGreen,
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
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        
                        const SizedBox(
                          width: 90,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 150,bottom: 10 ,top: 10),
                          child: Text(
                            "رقم الفاتورة : #00000",
                            style: TextStyle(
                              fontFamily: "ArabicUIDisplayBold",
                              fontWeight: FontWeight.bold,
                              color: darkGreen,
                            ),
                          ),
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
                            "xxxx : رقم الطلب",
                            style: TextStyle(
                              color: darkGreen,
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200),
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
                          height: 10,
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
                          height: 10,
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
                  color: yellow,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                            "عرض الفاتورة",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: darkGreen,
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
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        
                        const SizedBox(
                          width: 90,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 150,bottom: 10 ,top: 10),
                          child: Text(
                            "رقم الفاتورة : #00000",
                            style: TextStyle(
                              fontFamily: "ArabicUIDisplayBold",
                              fontWeight: FontWeight.bold,
                              color: darkGreen,
                            ),
                          ),
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
                            "xxxx : رقم الطلب",
                            style: TextStyle(
                              color: darkGreen,
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200),
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
                          height: 10,
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
                          height: 10,
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
                  color: yellow,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                            "عرض الفاتورة",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: darkGreen,
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
           
              ],
            ),
          )
        ],
      ),
    );
  }
}

