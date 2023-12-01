import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/strings.dart';

// ignore: must_be_immutable
class PreviousOrderContainer extends StatelessWidget {
  PreviousOrderContainer(
      {super.key, this.ontap, required this.status, required this.colorStaus});
  final String status;
  final Color colorStaus;
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, prevOrderDetails);
      },
      child: Container(
        width: .90 * MediaQuery.sizeOf(context).width,
        height: .15 * MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                        color: yellow, borderRadius: BorderRadius.circular(20)),
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
                    width: .4 * MediaQuery.sizeOf(context).width,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      "0000#",
                      style: TextStyle(
                          color: darkGreen,
                          fontFamily: 'ArabicUIDisplay',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    " : رقم الطلب",
                    style: TextStyle(
                        color: darkGreen,
                        fontFamily: 'ArabicUIDisplay',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                            color: colorStaus,
                            fontSize: 13,
                            fontFamily: 'ArabicUIDisplayBold',
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        ' : الحالة ',
                        style: TextStyle(
                            color: green,
                            fontSize: 13,
                            fontFamily: 'ArabicUIDisplayBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
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
          ],
        ),
      ),
    );
  }
}
