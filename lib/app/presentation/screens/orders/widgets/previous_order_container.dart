import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:libya_bakery/app/presentation/screens/orders/previous_order_details.dart';
import '../../../../controller/orders/pending_controller.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../models/orders_model.dart';

class PreviousOrderContainer extends GetView<PendingOrdersController> {
  const PreviousOrderContainer({super.key, required this.listData});
  final OrdersModel listData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const PreviousOrderDetails(), arguments: {'orderModel' : listData});
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
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      "${listData.orderId}#",
                      style: const TextStyle(
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
                          controller.printOrderStatus(listData.orderStatus.toString()),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    " التاريخ : ${Jiffy.parse(listData.orderDatetime!).format(pattern: 'MMMM do yyyy, h:mm:ss a')} ",
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
