import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/widgets/menu_row.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "القائمة",
                  style: TextStyle(
                    fontFamily: 'ArabicUIDisplayBold',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 27,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: yellow,
                    weight: 100,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            MenuRow(
              ontap: () {
                Navigator.pushReplacementNamed(context, home);
              },
              text: 'الصفحة الرئيسية',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Navigator.pushReplacementNamed(context, previousOrder);
              },
              text: 'طلباتك',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Navigator.pushReplacementNamed(context, favoriteScreen);
              },
              text: 'منتجاتك المفضلة ',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Navigator.pushNamed(context, problems);
              },
              text: '  الشكاوي والمقترحات ',
            ),
            const SizedBox(
              height: 20,
            ),
            const MenuRow(
              text: 'من نحن ؟ ',
            ),
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
                    Navigator.pushReplacementNamed(context, signUp);
                  }),
            )
          ],
        ))
      ]),
    );
  }
}
