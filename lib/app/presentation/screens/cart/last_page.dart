import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/presentation/screens/home/home.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';

import '../../../../admin/core/utils/app_color.dart';

class LastPage extends StatelessWidget {
  LastPage({super.key});
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
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: .3 * MediaQuery.sizeOf(context).height,
                ),
                Image.asset("assets/images/Group 10.png"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "تم ارسال الطلب ",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplay',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: darkGreen),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5, top: 10),
                  child: Text(
                    "سيتم تاكيده خلال لحظات وسيصل اليك خلال\n الطلب ",
                    style: TextStyle(
                        fontFamily: 'ArabicUIDisplayBold',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: green),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5, top: 10),
                  child: Text(
                    "يمكنك متابعه الطلبات الحاليه والسابقه\n عبر صفحه 'طلباتك'",
                    style: TextStyle(
                        fontFamily: 'ArabicUIDisplayBold',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: darkGreen),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: .2 * MediaQuery.sizeOf(context).height,
                ),
                InkWell(
                  onTap: (){
                    Get.offAll(() => const HomeScreen());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: .07 * MediaQuery.sizeOf(context).width),
                    width: 500,
                    height: 40,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              // offset: Offset(0, 0),
                              color: Color.fromARGB(255, 187, 186, 186),
                              blurRadius: 1,
                              spreadRadius: 2)
                        ],
                        color: darkGreen,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        "العودة للرئيسية ",
                        style: TextStyle(
                            fontFamily: 'ArabicUIDisplay',
                            color: yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
