import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/orders_accepted.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/orders_archive_screen.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/orders_pending.dart';

class OrderScreenController extends GetxController{
  int currentPage = 0;

  List<Widget> listPage = [
    OrderPendingScreen(),
    OrderAcceptedScreen(),
    OrderArchiveScreen(),
  ];

  List title = [
    "جارية",
    "قبلت",
    "سابقة",
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.add_shopping_cart_outlined,
    Icons.archive_outlined,
  ];

  changePage(int i){
    currentPage = i;
    update();
  }
}