import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class FavoriteCategoreCard extends StatelessWidget {
  const FavoriteCategoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: .75 * MediaQuery.sizeOf(context).width,
        height: .15 * MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 121, 119, 119),
            blurRadius: 1.0,
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              "assets/images/libya_bread.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5, top: 10),
                child: Text(
                  "خبزة سورية كبيرة ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ArabicUIDisplay',
                    color: darkGreen,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  """خبز سوري فاخر مخبوز من اجود\n انواع المكونات ويقدم طازج دائما """,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'ArabicUIDisplayBold',
                      color: green),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "(القطعة الواحدة)",
                    style: TextStyle(fontSize: 10, color: green),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2, bottom: 7),
                    child: Text(
                      " د.ل ",
                      style: TextStyle(
                          color: yellow,
                          fontSize: 20,
                          fontFamily: 'ArabicUIDisplay',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 1,
                    ),
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: yellow,
                          fontSize: 17,
                          fontFamily: 'ArabicUIDisplay',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
