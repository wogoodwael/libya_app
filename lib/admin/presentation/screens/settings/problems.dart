import 'package:flutter/material.dart';
import 'package:libya_bakery/admin/core/utils/person.dart';
import 'package:libya_bakery/admin/core/utils/strings.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/back_image.dart';
import '../../widgets/custom_next.dart';
import '../menu.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      body: Stack(
        children: [
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

                          SizedBox(
                            width: .04 * MediaQuery.sizeOf(context).width,
                          ),
                          const Text(
                            "الشكاوي والمقترحات",
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
                                child: SizedBox(
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
                  height: .03 * MediaQuery.sizeOf(context).height,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "اختر الفرع الذي يتم التعامل معه ",
                    style: TextStyle(
                        color: darkGreen,
                        fontFamily: 'ArabicUIDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  width: .89 * MediaQuery.sizeOf(context).width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              branchMenu(context);
                            },
                            icon: const Icon(Icons.arrow_drop_down_outlined)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            text ?? "يرجي الاختيار",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: .03 * MediaQuery.sizeOf(context).height,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    " ما الذي تريد التحدث عنه؟ ",
                    style: TextStyle(
                        color: darkGreen,
                        fontFamily: 'ArabicUIDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  width: .90 * MediaQuery.sizeOf(context).width,
                  height: .2 * MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: TextField(
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'اكتب هنا ',
                              hintStyle: TextStyle(color: Colors.grey),
                              hintTextDirection: TextDirection.rtl),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: .03 * MediaQuery.sizeOf(context).height,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20, top: 5),
                  child: Text(
                    "ادخل رقم هاتفك للتواصل",
                    style: TextStyle(
                        color: darkGreen,
                        fontFamily: 'ArabicUIDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: .02 * MediaQuery.sizeOf(context).height,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  alignment: Alignment.centerLeft,
                  width: .90 * MediaQuery.sizeOf(context).width,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'اكتب هنا ',
                                hintStyle: TextStyle(color: Colors.grey),
                                hintTextDirection: TextDirection.rtl),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: .02 * MediaQuery.sizeOf(context).height,
                ),
                CustomNext(text: 'ارسال')
              ],
            ),
          ),
        ],
      ),
    );
  }

  void branchMenu(BuildContext context) {
    showMenu(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      position: const RelativeRect.fromLTRB(1, 300, 50, 1),
      items: [
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = 'فرع تاجوراء';
            });
          },
          value: 1,
          child: const Text('فرع تاجوراء'),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = '  فرع عين زارة ';
            });
          },
          value: 2,
          child: const Text('  فرع عين زارة '),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = 'فرع ترابلس';
            });
          },
          value: 2,
          child: const Text(
            'فرع ترابلس',
          ),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = '  فرع مصراتة  ';
            });
          },
          value: 2,
          child: const Text(
            '  فرع مصراتة  ',
          ),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = 'فرع الزاويه ';
            });
          },
          value: 2,
          child: const Text('فرع الزاويه '),
        ),
      ],
    );
  }

}
//**
 /*
// */