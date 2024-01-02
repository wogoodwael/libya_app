import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/presentation/screens/auth/login/market_admin_login.dart';

import '../../core/utils/app_color.dart';

class CustomChooseContainer extends StatelessWidget {
  const CustomChooseContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const MarketLoginScreen());
          },
          child: Container(
            width: 150,
            height: 35,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 187, 186, 186),
                  blurRadius: 1,
                  spreadRadius: 2)
            ], borderRadius: BorderRadius.circular(5), color: darkGreen),
            child: const Center(
              child: Text(
                "صاحب متجر ",
                style: TextStyle(
                    fontFamily: 'ArabicUIDisplay',
                    color: yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
