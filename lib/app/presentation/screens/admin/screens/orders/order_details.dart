// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/orders/order_details_controller.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/back_image.dart';
import '../../../../../handling_data/handlng_data_view.dart';
import '../../../../widgets/custom_item_row.dart';


class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      backgroundColor: offwhite,
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Stack(
                children: [
                  const BackGroundImage(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: .20 * MediaQuery.sizeOf(context).height,
                          decoration: const BoxDecoration(
                              color: darkGreen,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: .1 * MediaQuery.sizeOf(context).height,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: .12 * MediaQuery.sizeOf(context).width,
                                  ),
                                  const Text(
                                    "تفاصيل الطلب",
                                    style: TextStyle(
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: yellow),
                                  ),
                                  SizedBox(
                                    width: .15 * MediaQuery.sizeOf(context).width,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: .04 * MediaQuery.sizeOf(context).height,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: Text(
                            textAlign: TextAlign.end,
                            "تفاصيل الطلب",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplay',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: darkGreen),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              width: .90 * MediaQuery.sizeOf(context).width,
                              height: .40 * MediaQuery.sizeOf(context).height,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 121, 119, 119),
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ...List.generate(controller.data.length,
                                          (index) => CustomOrderDetails(
                                        name: "${controller.data[index].itemsName}",
                                        count: "${controller.data[index].countitems}",
                                      )
                                  ),
                                ],
                              )
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                                width: .90 * MediaQuery.sizeOf(context).width,
                                height: .22 * MediaQuery.sizeOf(context).height,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 121, 119, 119),
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "المجموع___________________________${controller.ordersModel.orderPrice} د.ل",
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                          color: green,
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: .01 * MediaQuery.sizeOf(context).height,
                                    ),
                                    Text(
                                      "اجمالي التوصيل___________________________${controller.ordersModel.orderPricedelivery} د.ل",
                                      style: const TextStyle(
                                          color: green,
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: .01 * MediaQuery.sizeOf(context).height,
                                    ),
                                    Text(
                                      "اجمالي الفاتورة___________________________${controller.ordersModel.orderTotalprice} د.ل",
                                      style: const TextStyle(
                                          color: green,
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: .01 * MediaQuery.sizeOf(context).height,
                                    ),
                                    Text(
                                      controller.ordersModel.orderType == 0 ?
                                      "طريقة الدفع___________________________دفع عند المتجر"
                                          : "طريقة الدفع___________________________دفع عند الاستلام",
                                      style: const TextStyle(
                                          color: green,
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: .01 * MediaQuery.sizeOf(context).height,
                                    ),
                                    if(controller.ordersModel.orderType == 1)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "العنوان : ${controller.ordersModel.addressStreet}, ${controller.ordersModel.addressCity}",
                                          style: const TextStyle(
                                              color: green,
                                              fontFamily: 'ArabicUIDisplayBold',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  )
                ],
              )
          );
        }
      ),
    );
  }
}
