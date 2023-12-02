import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/person.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

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
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            children: [
              Text(
                'تفاصيل (الشكوي - المقترح)',
                style: TextStyle(
                  fontFamily: "ArabicUIDisplayBold",
                  fontSize: 20,
                  color: darkGreen,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(color: Color(0xff00403E), endIndent: 10, indent: 10),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: const Text(
                    "الفرع الذي يتم التعامل معه",
                    style: TextStyle(
                      fontFamily: "ArabicUIDisplayBold",
                      fontSize: 15,
                      color: Color(0xff006E40),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 350,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
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
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: const Text(
                    "تفاصيل الشكوى / المقترح",
                    style: TextStyle(
                      fontFamily: "ArabicUIDisplayBold",
                      fontSize: 15,
                      color: Color(0xff006E40),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 325,
                  height: 165,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                
                ),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Column(
            children: [
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
            const SizedBox(height: 15,),
          Column(
            children: [
              Container(
                width: 291,
                height: 45,
                decoration: const BoxDecoration(
                  color: Color(0xffbFED700),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))
                ),
                child: const Center(
                  child: Text(
                              "الرجوع إلى القائمة",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontSize: 18,
                                color: darkGreen,
                              ),
                  ),
                ),
              )
            ],
          )
        
        ],
      ),
    );
  }
}
