import 'package:flutter/material.dart';

import '../../controller/user_controller.dart';
import '../../core/utils/app_color.dart';

class ClientsBody extends StatelessWidget {
  final UserViewController controller;
  final int index;
  const ClientsBody({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: .8 * MediaQuery.sizeOf(context).width,
          height: .32 * MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 3)]),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${controller.data[index].firstName!}  ${controller.data[index].lastName!}',
                    style: const TextStyle(
                        fontFamily: 'ArabicUIDisplay',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: green),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      "assets/images/person.png",
                      fit: BoxFit.cover,
                      color: green,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: yellow,
                endIndent: 10,
                indent: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      controller.data[index].userType! == 1
                          ? "مستخدم عادي"
                          : controller.data[index].userType! == 2
                          ? "صاحب محل"
                          : controller.data[index].userType! == 3
                          ? "صاحب فرن"
                          : "Admin",
                      style: const TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                      " : نوع الحساب ",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: green),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      controller.data[index].usersCreate!,
                      style: const TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                      " : تاريخ الاضافة ",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: green),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.data[index].userFund! > 0 ?
                    Text(
                      '+${controller.data[index].userFund!.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                    : Text(
                      controller.data[index].userFund!.toStringAsFixed(2),
                      style: const TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    controller.data[index].userFund! >= 0 ?
                    const Text(
                      " : الرصيد الحالي ",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: green),
                    )
                    : const Text(
                      " : الدين الحالي ",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: green),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.data[index].mobile! == '' ?
                    const Text(
                      'لا يوجد',
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                        : Text(
                      controller.data[index].mobile!,
                      style: const TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                      " : رقم الهاتف ",
                      style: TextStyle(
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: green),
                    ),
                  ],
                ),
              ),
              // const Divider(
              //   thickness: 1,
              //   color: yellow,
              //   endIndent: 10,
              //   indent: 10,
              // ),
              // MaterialButton(
              //   elevation: 5,
              //   color: yellow,
              //   minWidth: .7 * MediaQuery.sizeOf(context).width,
              //   shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(20),
              //           topRight: Radius.circular(20))),
              //   onPressed: () {
              //     _dialogBuilder(context);
              //   },
              //   child: const Text(
              //     "الدين السابق ",
              //     style: TextStyle(
              //         fontFamily: 'ArabicUIDisplay',
              //         color: darkGreen,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 15),
              //   ),
              // )
            ],
          ),
        ),
        const SizedBox(height: 45,)
      ],
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Center(
              child: Text(
            'بناء علي اخر فاتورة تمت مع الفرع ',
            style: TextStyle(color: darkGreen),
          )),
          content: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 190,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("بناء علي اخر فاتورة تمت مع الفرع "),
                Divider(
                  color: yellow,
                  endIndent: 10,
                  indent: 10,
                  thickness: 2,
                ),
                Text(
                  " xxx________________  حساب عليه ",
                  style: TextStyle(color: green),
                ),
                Text(
                  " xxx__________________  حساب له ",
                  style: TextStyle(color: green),
                ),
                Text(
                  " xxx________  اجمالي الدين المراد دفعه  ",
                  style: TextStyle(color: green),
                ),
                Divider(
                  color: yellow,
                  endIndent: 10,
                  indent: 10,
                  thickness: 2,
                ),
                Text(
                  " xxx____________________  طريقة الدفع ",
                  style: TextStyle(color: green),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: .07 * MediaQuery.sizeOf(context).width),
              width: 500,
              height: 30,
              decoration: const BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: const Center(
                child: Text(
                  "الرجوع",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplay',
                      color: yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: .07 * MediaQuery.sizeOf(context).width),
              width: 500,
              height: 30,
              decoration: const BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: const Center(
                child: Text(
                  "الدفع عند الطلب القادم",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplay',
                      color: darkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: .07 * MediaQuery.sizeOf(context).width),
              width: 500,
              height: 30,
              decoration: const BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: const Center(
                child: Text(
                  " ادفع الان ",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplay',
                      color: darkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        );
      });
}
