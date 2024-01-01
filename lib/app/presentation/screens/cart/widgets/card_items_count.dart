import 'package:flutter/material.dart';

import '../../../../../admin/core/utils/app_color.dart';

class CartItemsCount extends StatelessWidget {
  String message;
  CartItemsCount({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 40,
      padding: const EdgeInsets.only(bottom: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Align(alignment: Alignment.center,child: Text(message,textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(fontSize: size.width * 0.06,color: Colors.white),)),
    );
  }
}
