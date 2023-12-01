import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

// ignore: must_be_immutable
class OrderContainer extends StatelessWidget {
   OrderContainer({super.key, this.ontap});
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: .65 * MediaQuery.sizeOf(context).width,
          height: .18 * MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 121, 119, 119),
              blurRadius: 1.0,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 60,
                      height: 20,
                      decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "عرض",
                          style: TextStyle(
                              color: darkGreen,
                              fontFamily: 'ArabicUIDisplayBold',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: .15 * MediaQuery.sizeOf(context).width,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        "0000#",
                        style: TextStyle(
                            color: darkGreen,
                            fontFamily: 'ArabicUIDisplayBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      " : رقم الطلب",
                      style: TextStyle(
                          color: darkGreen,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                color: yellow,
                endIndent: 10,
                indent: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      "الحالة : تم الاستلام ",
                      style: TextStyle(
                          color: green,
                          fontSize: 13,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      " التاريخ:15 اكتوبر 2023 -9:00 مساء ",
                      style: TextStyle(
                          color: green,
                          fontSize: 13,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, top: 3),
                    width: 90,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: yellow),
                    child: const Center(
                        child: Text(
                      "اعادة الطلب ",
                      style: TextStyle(
                          color: darkGreen,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
