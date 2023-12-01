import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/core/utils/strings.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: .20 * MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              color: darkGreen,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  "الشكاوي",
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
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Container(
              width: 330,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: 50,
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
                      const SizedBox(width: 90,),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "رقم الشكوي : #00000",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                color: darkGreen,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(color: yellow, endIndent: 10, indent: 10),
                  Container(
                    alignment: Alignment.topRight,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "xxxxx : إسم العميل",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplay-bold',
                              fontSize: 13,
                            ),
                          ),
                        ),
                       ],
                    ),
                  ),
                    Container(
                    alignment: Alignment.topRight,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplay-bold',
                              fontSize: 13,
                            ),
                          ),
                        ),
                       ],
                    ),
                  ),
                    Container(
                    alignment: Alignment.topRight,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "xxxxxxxxxx : الفرع",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplay-bold',
                              fontSize: 13,
                            ),
                          ),
                        ),
                       ],
                    ),
                  ),
                SizedBox(height: 2,),
                 Container(
                width: 291,
                height: 45,
                decoration: const BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                              "تواصل مع العميل",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontSize: 18,
                                color: Color(0xffbfed700),
                              ),
                  ),
                ),
              )
           
                ],
              ),
            ),

          ],
        ),
     SizedBox(height: 10,),
        Column(
          children: [
            Container(
              width: 330,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: 50,
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
                      const SizedBox(width: 90,),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "رقم الشكوي : #00000",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                color: darkGreen,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(color: yellow, endIndent: 10, indent: 10),
                  Container(
                    alignment: Alignment.topRight,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "xxxxx : إسم العميل",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplay-bold',
                              fontSize: 13,
                            ),
                          ),
                        ),
                       ],
                    ),
                  ),
                    Container(
                    alignment: Alignment.topRight,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplay-bold',
                              fontSize: 13,
                            ),
                          ),
                        ),
                       ],
                    ),
                  ),
                    Container(
                    alignment: Alignment.topRight,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "xxxxxxxxxx : الفرع",
                            style: TextStyle(
                              color: Color(0xff006E40),
                              fontFamily: 'ArabicUIDisplay-bold',
                              fontSize: 13,
                            ),
                          ),
                        ),
                       ],
                    ),
                  ),
                SizedBox(height: 2,),
                 Container(
                width: 291,
                height: 45,
                decoration: const BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                              "تواصل مع العميل",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontSize: 18,
                                color: Color(0xffbfed700),
                              ),
                  ),
                ),
              )
           
                ],
              ),
            ),
          ],
        )
     
      ]
      ),
      
    );
  }
}
