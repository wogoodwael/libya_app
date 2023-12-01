import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libya_bakery/business_logic/categoriesCubit/categories_cubit.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/data/models/categories_model.dart';
import 'package:libya_bakery/data/services/categories_services.dart';

// ignore: must_be_immutable
class CategoryContainer extends StatefulWidget {
  CategoryContainer({
    super.key,
    this.ontap,
  });

  void Function()? ontap;

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  List<CategoriesModel>? categoriesList;
  @override
  void initState() {
    super.initState();
    blocInit();
  }

  Future<void> blocInit() async {
    categoriesList =
        await BlocProvider.of<CategoriesCubit>(context).getCategoriesCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (BuildContext context, CategoriesState state) {
        if (state is Categoriesloading) {
          return const CircularProgressIndicator();
        } else if (state is CategoriesSuccess) {
          categoriesList =
              BlocProvider.of<CategoriesCubit>(context).categoriesList;

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              categoriesList!.length,
              (index) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: Container(
                      width: .35 * MediaQuery.sizeOf(context).width,
                      height: .25 * MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            '$categoriesImages/${categoriesList![index].categoriesImage}',
                            width: 150,
                            height: 130,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(categoriesList![index].categoriesName),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("  منتجات",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: green)),
                              Text(
                                  categoriesList![index]
                                      .categoriesId
                                      .toString(),
                                  style: const TextStyle(
                                    color: green,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ).reversed.toList(),
          );
        } else if (state is Categoriesfail) {
          print(categoriesList);
          return Center(
            child: TextButton(
              onPressed: () {
                CategoryServices().getCategoriesNames();
              },
              child: const Text("get data"),
            ),
          );
        }
        return const Center(
          child: Text("no data"),
        );
      },
    );
  }
}
