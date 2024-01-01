import 'package:flutter/material.dart';

import '../../../../../admin/core/utils/app_color.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({super.key, required this.img, required this.txt});
  final String img;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            img,
            width: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            txt,
            style: const TextStyle(
                fontFamily: 'ArabicUIDisplayBold',
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: darkGreen),
          ),
        )
      ],
    );
  }
}
