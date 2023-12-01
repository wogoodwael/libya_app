import 'package:flutter/material.dart';
import 'package:libya_bakery/data/models/categories_model.dart';
import 'package:libya_bakery/data/models/sub_categ_model.dart';
import 'package:libya_bakery/data/services/categories_services.dart';
import 'package:libya_bakery/data/services/sub_categories.dart';

class TestData extends StatefulWidget {
  const TestData({super.key});

  @override
  State<TestData> createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  List<SubCategoriesModel> subcategoriesList = [];
  SubCategoriesModel? subcategoriesModel;
  @override
  void initState() {
    super.initState();
    getCateg();
  }

  Future<void> getCateg() async {
    // subcategoriesList = await SubCategorieServices().getSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    // var data = categoryServices!.getCategoriesNames();
    return Scaffold(
        body: Column(
      children: [
        Center(
            child: Container(
                width: 200,
                height: 100,
                color: Colors.amber,
                child: ListView.builder(
                    itemCount: subcategoriesList.length,
                    itemBuilder: (context, index) {
                      return Row(children: [
                        Center(
                          child: Text('${subcategoriesList[index].items_desc}'),
                        ),
                      ]);
                    }))),
        TextButton(
            onPressed: () {
              // SubCategorieServices().getSubCategories();
            },
            child: Text("get data"))
      ],
    ));
  }
}
    //     body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    // ]));
    //   body: Center(
    // child: Container(
    //   width: 200,
    //   height: 100,
    //   color: Colors.amber,
    //   child: ListView.builder(
    //       itemCount: categoriesList.length,
    //       itemBuilder: (context, index) {
    //         return Row(
    //           children: [
    //             Center(
    //               child: Text('${categoriesList[index].categoriesName}'),
    //             ),

