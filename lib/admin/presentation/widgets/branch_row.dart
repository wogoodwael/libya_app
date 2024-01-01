import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';

class BranchContainer extends StatelessWidget {
  const BranchContainer({super.key, required this.img, required this.text});
  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 170,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1),
                blurRadius: 3,
                spreadRadius: 2)
          ],
          color: const Color(0xfffefeec),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,

        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 270,
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                fontFamily: 'ArabicUIDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: green),
          )
        ],
      ),
    );
  }
}
