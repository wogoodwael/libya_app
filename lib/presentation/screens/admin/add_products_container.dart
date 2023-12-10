import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

class AddProductsContainerScreen extends StatelessWidget {
  const AddProductsContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
    
      SizedBox(
        height: 10,
      ),
      Stack(
        children: [
          Container(
            width: .8 * MediaQuery.sizeOf(context).width,
            height: 50,
            decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0.0,
                    color: Colors.grey,
                  ),
                ]),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 220),
        child: Text(
          "التفاصيل",
          style: TextStyle(
              fontFamily: 'ArabicUIDisplayBold',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: darkGreen),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Stack(
        children: [
          Container(
            width: .8 * MediaQuery.sizeOf(context).width,
            height: 50,
            decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0.0,
                    color: Colors.grey,
                  ),
                ]),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 150),
        child: Text(
          "سعر القطعة الوحدة",
          style: TextStyle(
              fontFamily: 'ArabicUIDisplayBold',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: darkGreen),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Stack(
        children: [
          Container(
            width: .8 * MediaQuery.sizeOf(context).width,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "د.ل",
                style: TextStyle(
                    fontFamily: 'ArabicUIDisplayBold',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0.0,
                    color: Colors.grey,
                  ),
                ]),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 150),
        child: Text(
          "تعديل/إضافة صورة",
          style: TextStyle(
              fontFamily: 'ArabicUIDisplayBold',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: darkGreen),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Stack(
        children: [
          Container(
            width: .8 * MediaQuery.sizeOf(context).width,
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/images/editphoto.png")),
                color: darkGreen,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0.0,
                    color: Colors.grey,
                  ),
                ]),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 90),
        child: Text(
          "هل المنتج متوفر في الفرع؟",
          style: TextStyle(
              fontFamily: 'ArabicUIDisplayBold',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: darkGreen),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 170),
            width: .3 * MediaQuery.sizeOf(context).width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "نعم",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplayBold',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: darkGreen),
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
            decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0.0,
                    color: Colors.grey,
                  ),
                ]),
          ),
        ],
      ),
      SizedBox(
        height: 40,
      ),]
    );
  }
}
