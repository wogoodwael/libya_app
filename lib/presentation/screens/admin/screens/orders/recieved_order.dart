import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

class RecievedOrder extends StatelessWidget {
  const RecievedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: .9 * MediaQuery.sizeOf(context).width,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "عرض",
                          style: TextStyle(
                              fontFamily: "ArabicUIDisplay",
                              fontSize: 14,
                              color: darkGreen,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: Text(
                      "رقم الطلب : #00000",
                      style: TextStyle(
                        fontFamily: "ArabicUIDisplayBold",
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),
                  )
                ],
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
                      "الحالة : تم الاستلام",
                      style: TextStyle(
                        color: green,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                      style: TextStyle(
                        color: green,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
