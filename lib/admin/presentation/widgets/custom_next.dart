import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';

// ignore: must_be_immutable
class CustomNext extends StatelessWidget {
  CustomNext({super.key, required this.text, this.width});
  final String text;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: .07 * MediaQuery.sizeOf(context).width),
      width: width,
      height: 40,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                // offset: Offset(0, 0),
                color: Color.fromARGB(255, 187, 186, 186),
                blurRadius: 1,
                spreadRadius: 2)
          ],
          color: yellow,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'ArabicUIDisplay',
              color: darkGreen,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }
}
