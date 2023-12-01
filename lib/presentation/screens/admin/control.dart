import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/person.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            height: 50,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 140,
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/bills_admin.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "الفواتير",
                          style: TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF),
                          ),
                        )
                      ],
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: darkGreen),
                  ),
                  Container(
                    width: 140,
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/person_admin.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: darkGreen),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 140,
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/requests_admin.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: darkGreen),
                  ),
                  Container(
                    width: 140,
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/products_admin.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: darkGreen),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/complaints_admin.png"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
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
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: darkGreen),
              ),
            ],
          )
        ],
      ),
    );
  }
}
