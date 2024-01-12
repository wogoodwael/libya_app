import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {super.key,
      this.onTap,
      required this.text,
      });

  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: darkGreen, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    String.fromCharCode(Icons.arrow_back.codePoint),
                    style: TextStyle(
                      color: yellow,
                      inherit: false,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: Icons.space_dashboard_outlined.fontFamily,
                    ),
                  ),
                  const Text(
                    "المزيد ",
                    style: TextStyle(
                        fontFamily: 'ArabicUIDisplayBold',
                        color: yellow,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
              color: darkGreen,
              fontFamily: 'ArabicUIDisplay',
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
