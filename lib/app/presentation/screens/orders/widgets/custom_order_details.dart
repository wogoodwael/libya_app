import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';

class CustomOrderDetails extends StatelessWidget {
  final String name;
  final String count;
  const CustomOrderDetails({super.key, required this.name,required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: .01 * MediaQuery.sizeOf(context).height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "x$count",
                  style: const TextStyle(
                      color: green,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      color: green,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: .01 * MediaQuery.sizeOf(context).height,
            ),
          ],
        ),
      ),
    );
  }
}
