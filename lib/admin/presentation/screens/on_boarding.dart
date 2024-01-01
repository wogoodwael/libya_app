import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_color.dart';
import 'auth/login/sign_in.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: .09 * MediaQuery.sizeOf(context).height,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              radius: 120,
              backgroundColor: darkGreen,
              child: CircleAvatar(
                backgroundColor: offwhite,
                radius: 115,
                child: CircleAvatar(
                  radius: 110,
                  backgroundImage:
                      ExactAssetImage("assets/images/Onboarding.jpg"),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              """
          اجود انواع المنتجات 
          المخبوزه والطازجة 
          """,
              style: TextStyle(
                  fontFamily: 'ArabicUIDisplayBold',
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: darkGreen),
              textAlign: TextAlign.end,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              """
          تصنع مخبوزاتنا بأيدينا كل يوم من مكونات طبيعيه لكي  تقدم طازجه كل يوم 
          هنا في مخبزنا حيث تلتقي الاصالة بجودة منتجاتنا 
          لكي نرضي عملاؤنا بشكل كامل
          
          """,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: 'ArabicUIDisplayBold',
                  color: darkGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const SignInScreen());
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: .25 * MediaQuery.sizeOf(context).width),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      // offset: Offset(0, 0),
                      color: Color.fromARGB(255, 187, 186, 186),
                      blurRadius: 1,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: yellow,
              ),
              child: const Center(
                  child: Text(
                "التالي",
                style: TextStyle(
                    fontFamily: 'ArabicUIDisplay',
                    color: darkGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
            ),
          )
        ],
      )),
    );
  }
}
