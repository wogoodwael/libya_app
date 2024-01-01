import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/back_image.dart';
import '../../../../../core/utils/person.dart';
import '../../../menu.dart';

class BillDetails extends StatelessWidget {
  BillDetails({super.key});
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
                  SizedBox(
                    height: 30,
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تفاصيل الفاتورة",
                          style: TextStyle(
                              fontFamily: 'ArabicUIDisplay',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: darkGreen),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 35,
                          color: green,
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  const Divider(
                      color: darkGreen,
                      indent: 10,
                      endIndent: 10,
                      thickness: 2),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: .90 * MediaQuery.sizeOf(context).width,
                      height: .25 * MediaQuery.sizeOf(context).height,
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
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "تفاصيل الطلب ",
                              style: TextStyle(
                                  color: darkGreen,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            color: yellow,
                            endIndent: 10,
                            indent: 10,
                          ),
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            //  mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
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
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 20,
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
                            height: .01 * MediaQuery.sizeOf(context).height,
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
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
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 20,
                                ),
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                      color: darkGreen,
                                      fontSize: 17,
                                      fontFamily: 'ArabicUIDisplay',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Container(
                        width: .9 * MediaQuery.sizeOf(context).width,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "0000# : رقم الفاتورة",
                                    style: TextStyle(
                                      color: darkGreen,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "0000# : رقم الطلب",
                                    style: TextStyle(
                                      color: darkGreen,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "تاريخ اصدار الفاتورة : 15 أكتوبر , 2023 - 9:00 مساءً",
                                    style: TextStyle(
                                        color: Color(0xff006E40),
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: .90 * MediaQuery.sizeOf(context).width,
                      height: .32 * MediaQuery.sizeOf(context).height,
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
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "xxxx  _______________________  طريقة الاستلام",
                              style: TextStyle(
                                  color: green,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: .01 * MediaQuery.sizeOf(context).height,
                          ),
                          const Divider(
                            thickness: 2,
                            color: yellow,
                            endIndent: 10,
                            indent: 10,
                          ),
                          SizedBox(
                            height: .01 * MediaQuery.sizeOf(context).height,
                          ),
                          const Text(
                            "xxxx قيمة الطلب  _______________________________  د.ل",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: .02 * MediaQuery.sizeOf(context).height,
                          ),
                          const Text(
                            "xxxx الدين السابق  _____________________________  د.ل",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: .02 * MediaQuery.sizeOf(context).height,
                          ),
                          const Text(
                            "xxxx اجمالي الفاتورة  ___________________________  د.ل",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: .02 * MediaQuery.sizeOf(context).height,
                          ),
                          const Text(
                            "xxxx اجمالي الفاتورة  ___________________________  د.ل",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: .02 * MediaQuery.sizeOf(context).height,
                          ),
                          const Text(
                            "xxxxxx  ________________________   طريقة الدفع",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Container(
                          width: .9 * MediaQuery.sizeOf(context).width,
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
                              "طباعة",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplay",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffbFED700),
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
                          width: .9 * MediaQuery.sizeOf(context).width,
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
                              "تعديل الطلب",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplay",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: darkGreen,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ));
  }
}
