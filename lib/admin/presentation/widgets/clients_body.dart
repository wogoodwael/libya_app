import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
          height: .38 * MediaQuery.sizeOf(context).height,
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
              const Divider(
                thickness: 1,
                color: yellow,
                endIndent: 10,
                indent: 10,
              ),
              MaterialButton(
                elevation: 5,
                color: yellow,
                minWidth: .7 * MediaQuery.sizeOf(context).width,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          content: Container(
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(20)),
                            height: 110,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                    controller: controller.editUserFundController,
                                    obscureText: false,
                                    maxLines: 1,
                                    keyboardType: const TextInputType.numberWithOptions(signed: true),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'^-?\d+\.?\d{0,2}')),
                                    ],
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      hintTextDirection: TextDirection.rtl,
                                      hintText: "ادخل الرصيد",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            GestureDetector(
                              onTap: (){
                                Get.close(1);
                              },
                              child: Container(
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
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                controller.changeFund(
                                    controller.data[index].userId,
                                    controller.editUserFundController.text
                                );
                                Get.back();
                              },
                              child: Container(
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
                                    " عدل الان ",
                                    style: TextStyle(
                                        fontFamily: 'ArabicUIDisplay',
                                        color: darkGreen,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: const Text(
                  "تعديل الرصيد ",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplay',
                      color: darkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 45,)
      ],
    );
  }
}

