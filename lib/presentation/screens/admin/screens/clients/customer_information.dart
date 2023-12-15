import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/clients/market_information.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/clients/personal_info.dart';

import 'package:libya_bakery/presentation/screens/menu.dart';

class CustomerInformationScreen extends StatelessWidget {
  CustomerInformationScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      backgroundColor: offwhite,
      body: Stack(children: [
        Image.asset(
          "assets/images/back.png",
          color: Colors.grey.withOpacity(.2),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: .2 * MediaQuery.sizeOf(context).height,
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
                    Row(
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
                          "العملاء",
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
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              tabSection(context),

              // Positioned(top: 20, child: tabSection(context)),
            ],
          ),
        ),
      ]),
    );
  }
}

Widget tabSection(BuildContext context) {
  return const DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
        TabBar(
            dividerColor: darkGreen,
            labelStyle: TextStyle(
                fontFamily: 'ArabicUIDisplayBold',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)]),
            labelColor: yellow,
            indicatorColor: yellow,
            indicatorWeight: 3,
            unselectedLabelColor: darkGreen,
            unselectedLabelStyle: TextStyle(
                fontFamily: 'ArabicUIDisplayBold',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                shadows: [Shadow(color: Colors.black, blurRadius: 1)]),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: yellow,
                width: 4.0,
              ),
            ),
            tabs: [
              Tab(
                text: "معلومات المتجر",
              ),
              Tab(text: "معلومات شخصية"),
            ]),
        SizedBox(
          //Add this to give height
          height: 800,

          child: TabBarView(children: [
            //*body of tab1

            MarketInformationBody(),

            //*body of tab 2
            PersonalInfo(),
          ]),
        ),
      ],
    ),
  );
}
