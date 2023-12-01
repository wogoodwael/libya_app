import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/card/widgets/adress_card.dart';
import 'package:libya_bakery/presentation/screens/card/widgets/final_card.dart';
import 'package:libya_bakery/presentation/screens/card/widgets/order_shopping_card.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';

enum SingingCharacter { lafayette, jefferson }

class ConfirmOrders extends StatefulWidget {
  ConfirmOrders({super.key});

  @override
  State<ConfirmOrders> createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends State<ConfirmOrders> {
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
                          "تاكيد الطلب ",
                          style: TextStyle(
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 25,
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
                height: .05 * MediaQuery.sizeOf(context).height,
              ),
              const ShoppingCard(),
              AdressCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Radio(
                      activeColor: darkGreen,
                      value: 2,
                      groupValue: 1,
                      onChanged: (val) {}),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "   خلال  1-2 يوم ",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: green),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Radio(
                      activeColor: darkGreen,
                      value: 2,
                      groupValue: 1,
                      onChanged: (val) {}),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "   اختيار وقت اخر لتنفيذ الطلب",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: green),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
              PaymentCard(),
              SizedBox(
                height: .05 * MediaQuery.sizeOf(context).height,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, lastPageOrders);
                  },
                  child: CustomNext(text: 'تاكيد')),
              SizedBox(
                height: .05 * MediaQuery.sizeOf(context).height,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
