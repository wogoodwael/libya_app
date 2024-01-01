import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';

class CustomConfirmItemsList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final String discount;
  const CustomConfirmItemsList({super.key, required this.name, required this.price, required this.count, required this.image, required this.discount});

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
                  if (int.parse(discount) != 0) Positioned(
                      left: 160,
                      bottom: 5,
                      child: Image.asset("assets/images/sale.png",width: 50)),
                  Text(
                    name,
                    style: const TextStyle(
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
                  Text(
                    "x$count",
                    style: const TextStyle(
                        color: green,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: .27 * MediaQuery.sizeOf(context).width,
                      ),
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
                  ),
                ],
              ),
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
            ],
          ),

        ],
      ),
    );
  }
}
