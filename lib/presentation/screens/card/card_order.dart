import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/card/widgets/order_shopping_card.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';

class CardOrders extends StatelessWidget {
  CardOrders({super.key});
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
                  height: .25 * MediaQuery.sizeOf(context).height,
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
                            width: .055 * MediaQuery.sizeOf(context).width,
                          ),
                          const Person(),
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
                            width: .08 * MediaQuery.sizeOf(context).width,
                          ),
                          const Text(
                            "المشتريات",
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
                    ],
                  ),
                ),
                SizedBox(
                  height: .08 * MediaQuery.sizeOf(context).height,
                ),
                //*  order  card
                const ShoppingCard(),
                //* final card
                SizedBox(
                  height: .03 * MediaQuery.sizeOf(context).height,
                ),
                Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                        width: .90 * MediaQuery.sizeOf(context).width,
                        height: .1 * MediaQuery.sizeOf(context).height,
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
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "د.ل xxx ___________________________ المجموع",
                              style: TextStyle(
                                  color: green,
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: .01 * MediaQuery.sizeOf(context).height,
                            ),
                            const Text(
                              "د.ل xxx _______________________ اجمالي الفاتورة",
                              style: TextStyle(
                                  color: green,
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: .01 * MediaQuery.sizeOf(context).height,
                            ),
                          ],
                        ))),
                SizedBox(
                  height: .15 * MediaQuery.sizeOf(context).height,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, confirmOrders);
                    },
                    child: CustomNext(text: 'التالي'))
              ],
            ),
          ),
        ]));
  }
}
