import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';

class PreviousOrderDetails extends StatelessWidget {
  PreviousOrderDetails({super.key});
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
                      height: .08 * MediaQuery.sizeOf(context).height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: .01 * MediaQuery.sizeOf(context).width,
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: yellow,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),

                        SizedBox(
                          width: .1 * MediaQuery.sizeOf(context).width,
                        ),
                        const Text(
                          "طلباتك السابقة",
                          style: TextStyle(
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: yellow),
                        ),
                        SizedBox(
                          width: .1 * MediaQuery.sizeOf(context).width,
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
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
              //& order container
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  width: .90 * MediaQuery.sizeOf(context).width,
                  height: .15 * MediaQuery.sizeOf(context).height,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: .15 * MediaQuery.sizeOf(context).width,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Text(
                                "0000#",
                                style: TextStyle(
                                    color: darkGreen,
                                    fontFamily: 'ArabicUIDisplay',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Text(
                              " : رقم الطلب",
                              style: TextStyle(
                                  color: darkGreen,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        color: yellow,
                        endIndent: 10,
                        indent: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              "الحالة : تم الاستلام ",
                              style: TextStyle(
                                  color: green,
                                  fontSize: 13,
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              " التاريخ:15 اكتوبر 2023 -9:00 مساء ",
                              style: TextStyle(
                                  color: green,
                                  fontSize: 13,
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: .04 * MediaQuery.sizeOf(context).height,
              ),
              //& details Container
              Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                      width: .90 * MediaQuery.sizeOf(context).width,
                      height: .2 * MediaQuery.sizeOf(context).height,
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
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "تفاصيل الطلب ",
                              style: TextStyle(
                                  color: darkGreen,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            color: yellow,
                            endIndent: 10,
                            indent: 10,
                          ),
                          const Text(
                            "x3    ________________________ خبزة سورية كبيره",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: .01 * MediaQuery.sizeOf(context).height,
                          ),
                          const Text(
                            "x3   _______________________  خبزة سورية صغيرة",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: .01 * MediaQuery.sizeOf(context).height,
                          ),
                          const Text(
                            "x5    ________________________  توست ابيض كبير",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )))
              //&final container
              ,
              Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                      width: .90 * MediaQuery.sizeOf(context).width,
                      height: .17 * MediaQuery.sizeOf(context).height,
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
                            "د.ل xxx _______________________ حساب التوصيل",
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
                          const Text(
                            "د.ل xxx _________________________ طريقة الدفع ",
                            style: TextStyle(
                                color: green,
                                fontFamily: 'ArabicUIDisplayBold',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))),
             
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
              CustomNext(text: 'اعادة الطلب')
            ],
          ),
        ),
      ]),
    );
  }
}
