import 'package:flutter/material.dart';

import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/core/utils/strings.dart';

import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/screens/home/widgets/category_container.dart';
import 'package:libya_bakery/presentation/screens/home/widgets/custom_row.dart';
import 'package:libya_bakery/presentation/screens/home/widgets/orders_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
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
                height: .30 * MediaQuery.sizeOf(context).height,
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
                          width: .12 * MediaQuery.sizeOf(context).width,
                        ),
                        const Text(
                          "استكشف",
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
                    SizedBox(
                      height: .04 * MediaQuery.sizeOf(context).height,
                    ),
                    Container(
                      width: .85 * MediaQuery.sizeOf(context).width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20, top: 3),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(color: darkGreen),
                              suffixIcon: Icon(
                                Icons.search,
                                color: darkGreen,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: .05 * MediaQuery.sizeOf(context).height,
              ),
              //* go to categories page
              CustomRow(
                ontap: () {
                  Navigator.pushNamed(context, categories);
                },
                text: 'الاصناف ',
                widthOfSized: .45 * MediaQuery.sizeOf(context).width,
                widthOfpadding: .02 * MediaQuery.sizeOf(context).width,
              ),
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    //* go to sub category
                    CategoryContainer(
                      ontap: () {
                        Navigator.pushNamed(context, subCategory);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //* go to sub category
                  ],
                ),
              ),
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
              const Divider(
                thickness: 2,
                color: darkGreen,
                endIndent: 60,
                indent: 60,
              ),
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
              //* go to previos orders page
              CustomRow(
                ontap: () {
                  Navigator.pushNamed(context, previousOrder);
                },
                text: 'طلباتك ',
                widthOfSized: .46 * MediaQuery.sizeOf(context).width,
                widthOfpadding: .05 * MediaQuery.sizeOf(context).width,
              ),
              SizedBox(
                height: .02 * MediaQuery.sizeOf(context).height,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    //* go to order details  page
                    OrderContainer(
                      ontap: () {
                        Navigator.pushNamed(context, prevOrderDetails);
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    OrderContainer(
                      ontap: () {
                        Navigator.pushNamed(context, prevOrderDetails);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
