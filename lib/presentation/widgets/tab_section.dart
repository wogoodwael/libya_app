import 'package:flutter/material.dart';

import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/logo.dart';

import 'package:libya_bakery/presentation/screens/auth/login/sign_in_body.dart';

import 'package:libya_bakery/presentation/screens/auth/signup/widgets/sign_up_body.dart';

Widget tabSection(BuildContext context) {
  return const DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
   Logo(),
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
                text: "حساب جديد ",
              ),
              Tab(text: "تسجيل دخول"),
            ]),
        SizedBox(
          //Add this to give height
          height: 800,

          child: TabBarView(children: [
            //*body of tab1

            SignUpBody(),

            //*body of tab 2

            SignInBody()
          ]),
        ),
      ],
    ),
  );
}
