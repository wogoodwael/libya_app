import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/orders/accepted_controller.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/order_details.dart';

class AcceptedOrder extends StatelessWidget {
  final OrdersAcceptedController controller;
  final int index;
  const AcceptedOrder({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: .9 * MediaQuery.sizeOf(context).width,
          height: 210,
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
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.data[index].orderStatus == 1 ?
                    const Text(
                      "الحالة : جارٍ إعداد الطلب",
                      style: TextStyle(
                        color: green,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ):controller.data[index].orderStatus == 2 ?
                    const Text(
                      "الحالة : الطلب في الطريق",
                      style: TextStyle(
                        color: green,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ):
                    const Text(
                      "الحالة : تم الاستلام",
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
                      if(controller.data[index].orderStatus! == 2){
                        controller.archiveOrders2(
                            controller.data[index].orderUserid!,
                            controller.data[index].orderId!
                        );
                      } else {
                        controller.donePrepare(
                            controller.data[index].orderId!,
                            controller.data[index].orderUserid!,
                            controller.data[index].orderType!
                        );
                      }
                    },
                    child: Container(
                      width: .8 * MediaQuery.sizeOf(context).width,
                      height: 35,
                      decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                        color: darkGreen,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text(
                          "تم",
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
