import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/favorite/widgets/fav_details_card.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        endDrawer: const Drawer(
          width: 250,
          child: MenuScreen(),
        ),
        backgroundColor: offwhite,
        body: Stack(children: [
          const BackGroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: .22 * MediaQuery.sizeOf(context).height,
                  decoration: const BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: .09 * MediaQuery.sizeOf(context).height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: .03 * MediaQuery.sizeOf(context).width,
                          ),
                     Person(),
                          GestureDetector(
                            onTap: () {
                            Navigator.pushNamed(context, cardOrders);
                          },
                            child: const Icon(
                              Icons.shopping_cart_rounded,
                              size: 40,
                              color: yellow,
                            ),
                          ),
                          SizedBox(
                            width: .1 * MediaQuery.sizeOf(context).width,
                          ),
                          const Text(
                            "خبزة شامية",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: yellow),
                          ),
                          SizedBox(
                            width: .15 * MediaQuery.sizeOf(context).width,
                          ),
                          //^ go to menu page
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
                      SizedBox(
                        height: .04 * MediaQuery.sizeOf(context).height,
                      ),
                    ],
                  ),
                ),
                FavDetailsCard(),
                const Divider(
                  thickness: 1,
                  indent: 70,
                  endIndent: 70,
                  color: green,
                ),
                FavDetailsCard(),
                const Divider(
                  thickness: 1,
                  indent: 70,
                  endIndent: 70,
                  color: green,
                ),
                FavDetailsCard(),
                const Divider(
                  thickness: 1,
                  indent: 70,
                  endIndent: 70,
                  color: green,
                ),
                FavDetailsCard(),
              ],
            ),
          ),
          SizedBox(
            height: .05 * MediaQuery.sizeOf(context).height,
          ),
        ]));
  }
}
