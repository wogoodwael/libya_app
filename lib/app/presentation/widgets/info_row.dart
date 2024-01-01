// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../admin/core/utils/app_color.dart';

class InfoRow extends StatelessWidget {
  InfoRow({super.key, required this.text, this.icon, this.fontfamily, this.fontsize});
  final String text;
  IconData? icon;
  String? fontfamily;
  double? fontsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 1),
          child: Icon(
            icon,
            color: darkGreen,
            size: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: fontfamily,
                color: darkGreen,
                fontWeight: FontWeight.w700,
                fontSize: fontsize),
          ),
        ),
      ],
    );
  }
}
