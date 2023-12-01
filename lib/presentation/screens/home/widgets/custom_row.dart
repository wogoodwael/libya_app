import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

// ignore: must_be_immutable
class CustomRow extends StatelessWidget {
  CustomRow(
      {super.key,
      this.ontap,
      required this.text,
      required this.widthOfSized,
      required this.widthOfpadding});
  final String text;
  final double widthOfSized;
  final double widthOfpadding;
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: ontap,
            child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: darkGreen, borderRadius: BorderRadius.circular(20)),
              child: Center(
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
        ),
        SizedBox(
          width: widthOfSized,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: widthOfpadding,
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: darkGreen,
                fontFamily: 'ArabicUIDisplay',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
