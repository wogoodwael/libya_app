import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/presentation/screens/auth/login/sign_in.dart';
import 'package:libya_bakery/app/presentation/screens/favorite/favorite.dart';
import 'package:libya_bakery/app/presentation/screens/home/home.dart';
import 'package:libya_bakery/app/presentation/screens/orders/previous_orders.dart';
import 'package:libya_bakery/app/presentation/screens/settings/problems.dart';
import 'package:libya_bakery/app/presentation/widgets/menu_row.dart';
import 'package:libya_bakery/app/services/MyServices.dart';

import '../../core/utils/app_color.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  signOutUser() async {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'تسجيل خروج',
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟',style: TextStyle(fontFamily: 'ArabicUIDisplayBold',),),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'لا',
              style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
            )),
        TextButton(
            onPressed: () {
              MyServicesApp.sharedPreferences.clear();
              Get.offAll(() => const SignInScreen());
            },
            child: const Text(
              'نعم',
              style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Stack(children: [
        Image.asset(
          "assets/images/back.png",
          color: Colors.grey.withOpacity(.2),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "القائمة",
                  style: TextStyle(
                    fontFamily: 'ArabicUIDisplayBold',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 27,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 35,
                      color: yellow,
                      weight: 100,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            MenuRow(
              ontap: () {
                Get.to(() => const HomeScreen());
              },
              text: 'الصفحة الرئيسية',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Get.to(() => PreviousOrdersScreen());
                },
              text: 'طلباتك',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Get.to(() => FavoriteScreen());
                },
              text: 'منتجاتك المفضلة ',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Get.to(() => const ProblemScreen());
              },
              text: '  الشكاوي والمقترحات ',
            ),
            const SizedBox(
              height: 20,
            ),
            // const MenuRow(
            //   text: 'من نحن ؟ ',
            // ),
            SizedBox(
              height: .35 * MediaQuery.sizeOf(context).height,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 10),
              child: MaterialButton(
                  color: const Color.fromARGB(255, 140, 29, 29),
                  minWidth: 60,
                  child: const Text(
                    "تسجيل الخروج ",
                    style: TextStyle(
                        color: yellow,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    signOutUser();
                  }),
            )
          ],
        ))
      ]),
    );
  }
}
