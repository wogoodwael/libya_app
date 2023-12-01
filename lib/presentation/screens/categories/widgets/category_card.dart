import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libya_bakery/business_logic/categoriesCubit/categories_cubit.dart';
import 'package:libya_bakery/business_logic/sub_categories/sub_categories_cubit.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/data/models/categories_model.dart';
import 'package:libya_bakery/data/models/sub_categ_model.dart';

class CategoriesCard extends StatefulWidget {
  const CategoriesCard({super.key});

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  List<CategoriesModel>? categoriesList;
  List<SubCategoriesModel>? subcategoriesList;

  @override
  void initState() {
    super.initState();
    blocInit();
    blocInitSecond();
  }

  Future<void> blocInitSecond() async {
    subcategoriesList = await BlocProvider.of<SubCategoriesCubit>(context)
        .getSubCategoriesCupit();
  }

  Future<void> blocInit() async {
    categoriesList =
        await BlocProvider.of<CategoriesCubit>(context).getCategoriesCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is Categoriesloading) {
          return const CircularProgressIndicator();
        } else if (state is CategoriesSuccess) {
          categoriesList =
              BlocProvider.of<CategoriesCubit>(context).categoriesList;

          subcategoriesList =
              BlocProvider.of<SubCategoriesCubit>(context).subCategoriesList;
          print("#################${subcategoriesList?.length}");
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, subCategory);
            },
            child: Column(
                children: List.generate(
              categoriesList!.length,
              (index) => Column(
                children: [
                  Card(
                    elevation: 3,
                    child: Container(
                      width: .90 * MediaQuery.sizeOf(context).width,
                      height: .22 * MediaQuery.sizeOf(context).height,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                spreadRadius: 1)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: .45 * MediaQuery.sizeOf(context).width,
                            height: .2 * MediaQuery.sizeOf(context).height,
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    categoriesList![index].categoriesName,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: yellow,
                                        fontFamily: 'ArabicUIDisplay',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 5),
                                  child: Text(
                                    categoriesList![index]
                                        .categoriesdescription,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 8.2,
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    "عدد المنتجات : ${subcategoriesList?.length}",
                                    style: TextStyle(
                                        color: yellow,
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  width: 160,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text(
                                      "عرض ",
                                      style: TextStyle(
                                          color: green,
                                          fontFamily: 'ArabicUIDisplay',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 145,
                            width: 150,
                            child: Image.network(
                              "$itemsImages/${categoriesList![index].categoriesImage}",
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 50,
                    endIndent: 50,
                    color: green,
                  ),
                  SizedBox(
                    height: .03 * MediaQuery.sizeOf(context).height,
                  ),
                ],
              ),
            )),
          );
        } else {
          return const Center(
            child: Text("fail"),
          );
        }
      },
    );
  }
}
