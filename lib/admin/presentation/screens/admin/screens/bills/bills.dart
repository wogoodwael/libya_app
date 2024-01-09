import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/back_image.dart';
import '../../../../../core/utils/person.dart';
import '../../../menu.dart';
import 'bills_container.dart';

class BillsScreen extends StatelessWidget {
  BillsScreen({super.key});
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
                      ),
                      SizedBox(
                        height: .04 * MediaQuery.sizeOf(context).height,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Column(
                  children: [
                    BillsContainer(),
                    SizedBox(
                      height: 20,
                    ),
                    BillsContainer(),
                    SizedBox(
                      height: 20,
                    ),
                    BillsContainer(),
                    SizedBox(
                      height: 20,
                    ),
                    BillsContainer(),
                    //*
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
