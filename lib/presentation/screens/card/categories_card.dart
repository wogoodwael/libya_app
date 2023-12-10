import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/categories/edit_categories.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/sub_categories/edit_sub_categories.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            height: 210,
            width: .9 * MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      width: .3 * MediaQuery.sizeOf(context).width,
                      height: .3 * MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: offwhite,
                          border: Border.all(
                              color: green, style: BorderStyle.solid, width: 3),
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image:
                                  ExactAssetImage("assets/images/khuratt.png"),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Spacer(),
                    const Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'خبزة سورية كبيرة',
                        style: TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkGreen),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 9),
                        child: Text(
                          ' خبز سوري فاخر مخبوز من أجود \nانواع المكونات ويقدم طازج دائماً',
                          style: TextStyle(
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: green),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '(للقطعة الواحدة)',
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: green),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'د.ل',
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: yellow),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: yellow),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: .4 * MediaQuery.sizeOf(context).width,
                      height: 40,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ],
                          color: Color(0xffCD0000),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          "إزالة",
                          style: TextStyle(
                            fontFamily: "ArabicUIDisplay",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: offwhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditCategories()));
                      },
                      child: Container(
                        width: .4 * MediaQuery.sizeOf(context).width,
                        height: 40,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ],
                          color: yellow,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                        child: const Center(
                          child: Text(
                            'تعديل',
                            style: TextStyle(
                                fontFamily: "ArabicUIDisplay",
                                fontSize: 20,
                                color: green,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
