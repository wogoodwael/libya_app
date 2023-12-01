import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/client/widgets/custom_pass_container.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/presentation/widgets/info_row.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController pass = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.end,
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
                  ],
                ),
              ),
              SizedBox(
                height: .04 * MediaQuery.sizeOf(context).height,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 5),
                child: Text(
                  "تغير كلمه السر",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplay',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: green),
                ),
              ),
              const Divider(
                thickness: 2,
                color: darkGreen,
                endIndent: 10,
                indent: 10,
              ),
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  " يجب ان تكون كلمة السر الجديده مختلفه تماما عن القديمه ويجب اتباع التعليمات الخاصه عن وضع كلمة السر",
                  style: TextStyle(
                    fontFamily: 'ArabicUIDisplayBold',
                    fontSize: 19,
                    color: darkGreen,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 30),
                child: InfoRow(
                    fontsize: 20,
                    fontfamily: 'ArabicUIDisplayBold',
                    icon: Icons.error,
                    text: '  كلمة السر الجديدة '),
              ),
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
              CustomChangePass(controller: pass),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: InfoRow(
                    fontsize: 20,
                    fontfamily: 'ArabicUIDisplayBold',
                    icon: Icons.error,
                    text: '  تاكيد كلمة السر الجديدة '),
              ),
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
              CustomChangePass(controller: pass),
              SizedBox(
                height: .07 * MediaQuery.sizeOf(context).height,
              ),
              CustomNext(text: 'حفظ')
            ],
          ),
        ),
      ]),
    );
  }
}
