
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/app_color.dart';
import '../../data/services/api.dart';
import 'auth/login/sign_in.dart';
import 'on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    MyServices.sharedPreferences.getBool('firstTime') == true
        ?
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(() => const OnBoardingScreen());
      MyServices.sharedPreferences.setBool('firstTime', false);
    })
        :
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(() => const SignInScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 100,
              ),
              Image.asset(
                "assets/images/logo_two.png",
                width: 120,
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(left: .1 * MediaQuery.sizeOf(context).width),
            child: Text(
              "كوشتنا ",
              style: GoogleFonts.arefRuqaa(fontSize: 40, color: green),
            ),
          )
        ]),
      ),
    );
  }
}
