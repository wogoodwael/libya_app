import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/categories/categories.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/sub_categories/edit_sub_categories.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            width: .97 * MediaQuery.sizeOf(context).width,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: .57 * MediaQuery.sizeOf(context).width,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGreen,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          EditSubCategoriesScreen()));
                            },
                            child: Image.asset(
                              "assets/images/edit.png",
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "خبزة شامية",
                              style: TextStyle(
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: yellow),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        textAlign: TextAlign.end,
                        'تشكيلة من افضل انواع الخبز السوري و اللبناني يتم \nتحضيره يوميا لضمان افضل جودة للخبز الطازج',
                        style: TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: offwhite),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        textAlign: TextAlign.start,
                        'عدد المنتجات : 4',
                        style: TextStyle(
                            fontFamily: 'ArabicUIDisplayBold',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: yellow),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Categories()));
                        },
                        child: Container(
                          width: .5 * MediaQuery.sizeOf(context).width,
                          height: 30,
                          child: Center(
                            child: Text(
                              'عرض',
                              style: TextStyle(
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 160,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: ExactAssetImage("assets/images/bread.png"),
                          fit: BoxFit.cover),
                      color: yellow,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ],
      ),
      const Divider(
        indent: 50,
        endIndent: 50,
        color: darkGreen,
        thickness: 1,
        height: 50,
      )
    ]);
  }
}
