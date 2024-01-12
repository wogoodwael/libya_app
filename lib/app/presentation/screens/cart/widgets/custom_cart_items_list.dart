import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';

class CustomCartItemsList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final String discount;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomCartItemsList({super.key, required this.name, required this.price, required this.count, required this.image, this.onAdd, this.onRemove, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "x$count",
                    style: const TextStyle(
                        color: green,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    name,
                    style:  TextStyle(
                      fontSize: Get.width * 0.03,
                        color: green,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: onRemove,
                            icon: const Icon(
                              Icons.remove,
                              color: darkGreen,
                              size: 20,
                            )),
                        Text(
                          count,
                          style: const TextStyle(
                              color: darkGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: onAdd,
                            icon: const Icon(
                              Icons.add,
                              color: darkGreen,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 7),
                        child: Text(
                          " د.ل ",
                          style: TextStyle(
                              color: darkGreen,
                              fontSize: 20,
                              fontFamily: 'ArabicUIDisplay',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 1,
                        ),
                        child: Text(
                          price,
                          style: const TextStyle(
                              color: darkGreen,
                              fontSize: 17,
                              fontFamily: 'ArabicUIDisplay',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
            ],
          ),
          if (int.parse(discount) != 0) Positioned(
              left: 160,
              bottom: 5,
              child: Image.asset("assets/images/sale.png",width: 50))
        ],
      ),
    );
  }
}
