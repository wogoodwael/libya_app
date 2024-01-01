import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:libya_bakery/app/presentation/screens/orders/previous_orders.dart';
import '../../../../../admin/core/utils/app_color.dart';
import '../../../../controller/orders/pending_controller.dart';
import '../../../../models/orders_model.dart';

class OrdersListCard extends GetView<PendingOrdersController> {
  final OrdersModel listData;
  const OrdersListCard({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  GestureDetector(
                    onTap:(){
                      Get.to(() => PreviousOrdersScreen());
                      },
                    child: Container(
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
                  ),
                  SizedBox(
                    width: .15 * MediaQuery.sizeOf(context).width,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      '${listData.orderId}',
                      style: const TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    "الحالة : ${controller.printOrderStatus(listData.orderStatus.toString())}",
                    style: TextStyle(
                        color: controller.printOrderStatus(listData.orderStatus.toString()) == "Awaiting Approval" ?
                  Colors.red :
                  controller.printOrderStatus(listData.orderStatus.toString()) == "Order is Being Prepared" ?
                  Colors.orange :
                  controller.printOrderStatus(listData.orderStatus.toString()) == "Order on the Way" ?
                  Colors.green :
                  controller.printOrderStatus(listData.orderStatus.toString()) == "Archive" ?
                  Colors.blue :
                  Colors.grey,
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
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    " التاريخ : \n${Jiffy.parse(listData.orderDatetime!).format(pattern: 'MMMM do yyyy, h:mm:ss a')} ",
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
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
