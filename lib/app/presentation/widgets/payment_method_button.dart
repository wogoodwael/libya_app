import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';

// ignore: must_be_immutable
class PaymentMethodButton extends StatelessWidget {
  PaymentMethodButton({super.key, required this.text, this.width, required this.isActive});
  final String text;
  double? width;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: .07 * MediaQuery.sizeOf(context).width),
      width: width,
      height: 40,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              // offset: Offset(0, 0),
                color: Color.fromARGB(255, 187, 186, 186),
                blurRadius: 1,
                spreadRadius: 2)
          ],
          color: isActive == true ? Colors.green : yellow,
          borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'ArabicUIDisplay',
              color: darkGreen,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
