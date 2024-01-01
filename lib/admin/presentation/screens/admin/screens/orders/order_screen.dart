import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/orders/order_screen_controller.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../widgets/custom_bottom_nav_bar_button.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenController());
    return GetBuilder<OrderScreenController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar:  BottomAppBar(
            color: darkGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                    controller.listPage.length,
                        (index) => CustomBottomNavigationBarButton(
                      textButton: controller.title[index],
                      iconData: controller.icons[index],
                      active: controller.currentPage == index ? true : false,
                      onPressed: (){
                        controller.changePage(index);
                      },
                    )
                )
              ],
            ),
          ),
          body: controller.listPage.elementAt(controller.currentPage),
        );
      }
    );
  }
}
