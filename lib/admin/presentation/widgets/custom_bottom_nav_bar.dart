import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/orders/order_screen_controller.dart';
import 'custom_bottom_nav_bar_button.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenController());
    return GetBuilder<OrderScreenController>(
      builder: (controller) {
        return BottomAppBar(
          child: Row(
            children: [
              ...List.generate(
                  controller.listPage.length,
                      (index) => CustomBottomNavigationBarButton(
                        textButton: controller.title[index > 2 ? index -1 : index],
                        iconData: controller.icons[index],
                        active: controller.currentPage == index ? true : false,
                        onPressed: controller.changePage(index > 2 ? index -1 : index),
                      )
              )
            ],
          ),
        );
      }
    );
  }
}
