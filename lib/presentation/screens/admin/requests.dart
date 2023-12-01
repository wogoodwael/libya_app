import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/person.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

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
       
        ],
      ),
    );
  }
}
