import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import '../../api_connection/api_connection.dart';
import '../../controller/home_controller.dart';
import '../../core/utils/app_color.dart';
import '../../handling_data/handlng_data_view.dart';
import '../../models/items_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequestSearch,
            widget: Stack(
                    children: [
                      const BackGroundImage(),
                      SingleChildScrollView(
                        child: Column(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: .15 * MediaQuery.sizeOf(context).height,
                                decoration: const BoxDecoration(
                                    color: darkGreen,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: .06 * MediaQuery.sizeOf(context).height,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: .12 * MediaQuery.sizeOf(context).width,
                                        ),
                                        const Text(
                                          "استكشف",
                                          style: TextStyle(
                                              fontFamily: 'ArabicUIDisplayBold',
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: yellow),
                                        ),
                                        SizedBox(
                                          width: .15 * MediaQuery.sizeOf(context).width,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ListItemsSearch(list: controller.list)
                            ],
                          ),
                      ),
                    ],
                  ),
          );
        }
      )
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> list;
  const ListItemsSearch({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.back();
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Image.network(
                            "${API.itemsImages}/${list[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(list[index].itemsName!,style: const TextStyle(fontFamily: 'ArabicUIDisplay',),textDirection: TextDirection.rtl,),
                          subtitle: Text(list[index].categoriesName!,style: const TextStyle(fontFamily: 'ArabicUIDisplay',),textDirection: TextDirection.rtl,),
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
