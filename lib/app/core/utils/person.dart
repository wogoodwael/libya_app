import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/presentation/screens/client/profile.dart';
import 'app_color.dart';

class AppPerson extends StatelessWidget {
  const AppPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProfileScreen());
      },
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(
          "assets/images/person.png",
          fit: BoxFit.cover,
          color: yellow,
        ),
      ),
    );
  }
}
