import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import 'bill_details.dart';

class BillsContainer extends StatelessWidget {
  const BillsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .9 * MediaQuery.sizeOf(context).width,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(255, 255, 255, 1)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "رقم الفاتورة : #00000",
                  style: TextStyle(
                    fontFamily: "ArabicUIDisplay",
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: yellow,
            endIndent: 10,
            indent: 10,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "xxxx : رقم الطلب",
                  style: TextStyle(
                      color: darkGreen,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "الحالة : تم الاستلام",
                  style: TextStyle(
                      color: Color(0xff006E40),
                      fontFamily: 'ArabicUIDisplayBold',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                  style: TextStyle(
                      color: Color(0xff006E40),
                      fontFamily: 'ArabicUIDisplayBold',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: yellow,
            endIndent: 10,
            indent: 10,
            thickness: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BillDetails()));
                },
                child: Container(
                  width: .8 * MediaQuery.sizeOf(context).width,
                  height: 35,
                  decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
                    color: yellow,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text(
                      "عرض الفاتورة",
                      style: TextStyle(
                        fontFamily: "ArabicUIDisplay",
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: darkGreen,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
