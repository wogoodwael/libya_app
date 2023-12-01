import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/screens/favorite/widgets/fav_details_card.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
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
                  height: .28 * MediaQuery.sizeOf(context).height,
                  decoration: const BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: .08 * MediaQuery.sizeOf(context).height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: .02 * MediaQuery.sizeOf(context).width,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              "assets/images/person.png",
                              fit: BoxFit.cover,
                              color: yellow,
                            ),
                          ),
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
                            width: .5 * MediaQuery.sizeOf(context).width,
                          ),

                          //^ go to menu page
                          GestureDetector(
                              onTap: () {
                                scaffoldKey.currentState!.openEndDrawer();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  width: 32,
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
                        height: .01 * MediaQuery.sizeOf(context).height,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20, top: 5),
                            child: Text(
                              "منتجاتك المفضلة ",
                              style: TextStyle(
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: yellow),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: .05 * MediaQuery.sizeOf(context).height,
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
        ]));
  }
}
