import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
            width: .90 * MediaQuery.sizeOf(context).width,
            height: .17 * MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 121, 119, 119),
                blurRadius: 1.0,
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "د.ل xxx ___________________________ المجموع",
                  style: TextStyle(
                      color: green,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                const Text(
                  "د.ل xxx _______________________ حساب التوصيل",
                  style: TextStyle(
                      color: green,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                const Text(
                  "د.ل xxx _______________________ اجمالي الفاتورة",
                  style: TextStyle(
                      color: green,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                const Text(
                  "د.ل xxx _________________________ طريقة الدفع ",
                  style: TextStyle(
                      color: green,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
              ],
            )));
  }
}
