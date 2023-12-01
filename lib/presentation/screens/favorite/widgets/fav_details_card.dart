import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libya_bakery/business_logic/sub_categories/sub_categories_cubit.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/data/models/sub_categ_model.dart';

class FavDetailsCard extends StatefulWidget {
  FavDetailsCard({super.key});

  @override
  State<FavDetailsCard> createState() => _FavDetailsCardState();
}

class _FavDetailsCardState extends State<FavDetailsCard> {
  bool isfav = false;
  List<SubCategoriesModel>? subcategoriesList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blocInit();
  }

  Future<void> blocInit() async {
    // subcategoriesList = await BlocProvider.of<SubCategoriesCubit>(context)
    //     .getSubCategoriesCupit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
      builder: (context,SubCategoriesState state) {
      
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: .90 * MediaQuery.sizeOf(context).width,
            height: .26 * MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 121, 119, 119),
                blurRadius: 1.0,
              ),
            ], borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: .1 * MediaQuery.sizeOf(context).height),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            isfav = !isfav;
                          });
                        },
                        icon: !isfav
                            ? Icon(Icons.favorite_border)
                            : Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                  ),
                  Container(
                    width: 125,
                    height: 120,
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Image.asset(
                      "assets/images/libya_bread.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
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
                      const Padding(
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
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
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
                      ),
                      Container(
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove,
                                  color: yellow,
                                )),
                            const Text(
                              "1",
                              style: TextStyle(
                                  color: yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: yellow,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: .85 * MediaQuery.sizeOf(context).width,
                  height: 40,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            // offset: Offset(0, 0),
                            color: Color.fromARGB(255, 187, 186, 186),
                            blurRadius: 1,
                            spreadRadius: 1.5)
                      ],
                      color: yellow,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  child: const Center(
                    child: Text(
                      "اضف الي العربة ",
                      style: TextStyle(
                          color: green,
                          fontSize: 20,
                          fontFamily: 'ArabicUIDisplay',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
