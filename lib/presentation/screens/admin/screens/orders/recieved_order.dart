import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/orders/archive_controller.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'order_details.dart';

class RecievedOrder extends StatelessWidget {
  final OrdersArchiveController controller;
  final int index;
  const RecievedOrder({super.key, required this.controller, required this.index});

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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "التاريخ : ${controller.data[index].orderDatetime}ً",
                      style: const TextStyle(
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
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
