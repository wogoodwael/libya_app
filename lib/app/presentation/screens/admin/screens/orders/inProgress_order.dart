import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/orders/pending_controller.dart';
import '../../../../../core/utils/app_color.dart';
import 'order_details.dart';

class InProgress extends StatelessWidget {
  final OrdersPendingController controller;
  final int index;
  const InProgress({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: .9 * MediaQuery.sizeOf(context).width,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(() => const OrderDetails(),arguments: {
                        "orderModel" : controller.data[index]
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
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
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Text(
                      "رقم الطلب : #${controller.data[index].orderId}",
                      style: const TextStyle(
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
                      "الحالة : في انتظار الموافقة",
                      style: TextStyle(
                        color: green,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
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
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: yellow,
                endIndent: 10,
                indent: 10,
                thickness: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.approveOrders(
                          controller.data[index].orderUserid!,
                          controller.data[index].orderId!
                      );
                    },
                    child: Container(
                      width: .8 * MediaQuery.sizeOf(context).width,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: darkGreen,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text(
                          "قبول",
                          style: TextStyle(
                            fontFamily: "ArabicUIDisplayBold",
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: offwhite,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.archiveOrders(
                          controller.data[index].orderUserid!,
                          controller.data[index].orderId!
                      );
                    },
                    child: Container(
                      width: .8 * MediaQuery.sizeOf(context).width,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text(
                          "إلغاء",
                          style: TextStyle(
                            fontFamily: "ArabicUIDisplayBold",
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: offwhite,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
