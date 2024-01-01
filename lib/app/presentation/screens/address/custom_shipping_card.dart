import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';

class CustomShippingCard extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const CustomShippingCard({super.key, required this.title, required this.body, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isActive == true ? darkGreen : green,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      // InkWell(
                      //   onTap: (){
                      //     //edit current address with id
                      //   },
                      //   child: Image.asset(
                      //     "assets/images/edit.png",
                      //     width: 50,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Text(
                            body,
                          style: const TextStyle(
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
