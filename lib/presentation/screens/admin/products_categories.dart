import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class ProductsCategoriesScreen extends StatelessWidget {
  ProductsCategoriesScreen({super.key});
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
                          "المنتجات",
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
                        const Icon(
                          Icons.arrow_forward,
                          size: 40,
                          color: yellow,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: .04 * MediaQuery.sizeOf(context).height,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      width: .3 * MediaQuery.sizeOf(context).width,
                      height: .04 * MediaQuery.sizeOf(context).height,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: yellow,
                          ),
                          Text(
                            "إضافة صنف",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: yellow),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: darkGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(
                      width: .3 * MediaQuery.sizeOf(context).width,
                    ),
                    const Text(
                      "الاصناف",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: darkGreen),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(children: [
                Stack(
                  children: [
                    Container(
                      width: .9 * MediaQuery.sizeOf(context).width,
                      height: 230,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: .6 * MediaQuery.sizeOf(context).width,
                            height: 180,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Image.asset("assets/images/edit.png"),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "خبزة شامية",
                                      style: TextStyle(
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: yellow),
                                    ),
                                  ],
                                ),
                                Text(
                                  textAlign: TextAlign.end,
                                  'تشكيلة من افضل انواع الخبز السوري و اللبناني يتم \nتحضيره يوميا لضمان افضل جودة للخبز الطازج',
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: offwhite),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  textAlign: TextAlign.start,
                                  'عدد المنتجات : 4',
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: yellow),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: .5 * MediaQuery.sizeOf(context).width,
                                  height: 30,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'عرض',
                                    style: TextStyle(
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: darkGreen),
                                  ),
                                  decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(20)),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGreen,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 190,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ExactAssetImage(
                                        "assets/images/bread.png"),
                                    fit: BoxFit.cover),
                                color: yellow,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: offwhite,
                      ),
                    ),
                  ],
                ),
                Divider(
                  indent: 50,
                  endIndent: 50,
                  color: darkGreen,
                  thickness: 3,
                  height: 50,
                  
                )
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
