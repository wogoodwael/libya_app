import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/strings.dart';

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, profile);
      },
      child: Container(
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
