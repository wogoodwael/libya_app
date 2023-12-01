import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

class AdressCard extends StatelessWidget {
  const AdressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
            width: .90 * MediaQuery.sizeOf(context).width,
            height: .45 * MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 121, 119, 119),
                blurRadius: 1.0,
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15, right: 5),
                  child: Text(
                    " : اختار عنوان للشحن اليه  ",
                    style: TextStyle(
                        color: darkGreen,
                        fontFamily: 'ArabicUIDisplay',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: yellow,
                  endIndent: 10,
                  indent: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio(
                            activeColor: darkGreen,
                            value: 1,
                            groupValue: 1,
                            onChanged: (val) {}),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "عنوان المتجر ",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: darkGreen),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/edit.png",
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("xxxxxxxxxxxxxxxxxxx\nxxxxxxxxxxxxxxxxxx"),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: darkGreen,
                      endIndent: 10,
                      indent: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio(
                            activeColor: darkGreen,
                            value: 2,
                            groupValue: 1,
                            onChanged: (val) {}),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "عنوان المتجر ",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: darkGreen),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/edit.png",
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("xxxxxxxxxxxxxxxxxxx\nxxxxxxxxxxxxxxxxxx"),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: darkGreen,
                      endIndent: 10,
                      indent: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: .2 * MediaQuery.sizeOf(context).width),
                      width: 200,
                      height: 40,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                // offset: Offset(0, 0),
                                color: Color.fromARGB(255, 187, 186, 186),
                                blurRadius: 1,
                                spreadRadius: 2)
                          ],
                          color: darkGreen,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Center(
                        child: Text(
                          "اضف عنوان اخر",
                          style: const TextStyle(
                              fontFamily: 'ArabicUIDisplay',
                              color: yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
