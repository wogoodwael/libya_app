import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
            width: .90 * MediaQuery.sizeOf(context).width,
            height: .25 * MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 121, 119, 119),
                blurRadius: 1.0,
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "تفاصيل الطلب ",
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
                const Text(
                  "x3    ________________________ خبزة سورية كبيره",
                  style: TextStyle(
                      color: green,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: darkGreen,
                                size: 20,
                              )),
                          const Text(
                            "3",
                            style: TextStyle(
                                color: darkGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: darkGreen,
                                size: 20,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: .3 * MediaQuery.sizeOf(context).width,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 2, bottom: 7),
                      child: Text(
                        " د.ل ",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 20,
                            fontFamily: 'ArabicUIDisplay',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 1,
                      ),
                      child: Text(
                        "3",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 17,
                            fontFamily: 'ArabicUIDisplay',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                const Text(
                  "x5    ________________________  توست ابيض كبير",
                  style: TextStyle(
                      color: green,
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: darkGreen,
                                size: 20,
                              )),
                          const Text(
                            "5",
                            style: TextStyle(
                                color: darkGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: darkGreen,
                                size: 20,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: .3 * MediaQuery.sizeOf(context).width,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 2, bottom: 7),
                      child: Text(
                        " د.ل ",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 20,
                            fontFamily: 'ArabicUIDisplay',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 1,
                      ),
                      child: Text(
                        "5",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 17,
                            fontFamily: 'ArabicUIDisplay',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
