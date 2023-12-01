import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/client/widgets/profile_row.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
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
                        height: .08 * MediaQuery.sizeOf(context).height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: .01 * MediaQuery.sizeOf(context).width,
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
                            width: .04 * MediaQuery.sizeOf(context).width,
                          ),
                          const Text(
                            " حسابك",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: yellow),
                          ),
                          SizedBox(
                            width: .02 * MediaQuery.sizeOf(context).width,
                          ),

                          //* go to menu page
                          GestureDetector(
                              onTap: () {
                                scaffoldKey.currentState!.openEndDrawer();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
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
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: yellow,
                              size: 30,
                              weight: 200,
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, home);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: .04 * MediaQuery.sizeOf(context).height,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: .04 * MediaQuery.sizeOf(context).height,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        ExactAssetImage("assets/images/persontwo.png"),
                  ),
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                const Center(
                  child: Text(
                    "لوريم ايبسوم",
                    style: TextStyle(
                        fontFamily: 'ArabicUIDisplay',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: darkGreen),
                  ),
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                const Divider(
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: green,
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, personalInfo);
                  },
                  child: const ProfileRow(
                      img: "assets/images/edit.png", txt: 'معلومات شخصية'),
                ),
                SizedBox(
                  height: .02 * MediaQuery.sizeOf(context).height,
                ),
                const ProfileRow(
                    img: "assets/images/edit.png", txt: 'معلومات عن المتجر'),
                SizedBox(
                  height: .02 * MediaQuery.sizeOf(context).height,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: green,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        " تغير كلمة السر ",
                        style: TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: darkGreen),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: .04 * MediaQuery.sizeOf(context).height,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: green,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        " تغير الفرع  ",
                        style: TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: darkGreen),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: .04 * MediaQuery.sizeOf(context).height,
                ),
                MaterialButton(
                    color: const Color.fromARGB(255, 140, 29, 29),
                    minWidth: 60,
                    child: const Text(
                      "تسجيل الخروج ",
                      style: TextStyle(
                          color: yellow,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, signUp);
                    }),
              ],
            ),
          ),
        ]));
  }
}
