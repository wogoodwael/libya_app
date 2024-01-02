import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/presentation/screens/cart/card_order.dart';
import 'package:libya_bakery/app/services/MyServices.dart';
import '../../../../api_connection/api_connection.dart';
import '../../../../controller/favorite_controller.dart';
import '../../../../controller/product_details_controller.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../models/items_model.dart';

class CustomListItems extends StatefulWidget {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  State<CustomListItems> createState() => _CustomListItemsState();
}

class _CustomListItemsState extends State<CustomListItems> {

  method()async{
    ProductDetailsControllerImp productDetailsControllerImp =
    Get.put(ProductDetailsControllerImp());
    productDetailsControllerImp.itemsModel = widget.itemsModel;
    var countItems = await productDetailsControllerImp.getCountItems(widget.itemsModel.itemsId);
    productDetailsControllerImp.countItems = countItems as int;
  }

  @override
  void initState() {
    super.initState();
    method();
  }
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    var branchCode = int.parse(MyServicesApp.sharedPreferences.getString("branch_code").toString());
    var userType = int.parse(MyServicesApp.sharedPreferences.getString("user_type").toString());
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
            GetBuilder<ProductDetailsControllerImp>(
              builder: (controller) {
                return Row(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: .1 * MediaQuery.sizeOf(context).height),
                    child: GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[widget.itemsModel.itemsId] == 1) {
                                controller.setFavorite(widget.itemsModel.itemsId, 0);
                                controller.removeFavorite(widget.itemsModel.itemsId);
                              }  else {
                                controller.setFavorite(widget.itemsModel.itemsId, 1);
                                controller.addFavorite(widget.itemsModel.itemsId,widget.itemsModel.itemsName);
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[widget.itemsModel.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                            )))
                  ),
                  Container(
                    width: 125,
                    height: 120,
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Image.network(
                     '${API.itemsImages}/${widget.itemsModel.itemsImage}',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, top: 10),
                        child: Text(
                          widget.itemsModel.itemsName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ArabicUIDisplay',
                            color: darkGreen,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                            widget.itemsModel.itemsDesc!,
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'ArabicUIDisplayBold',
                              color: green),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            "(القطعة الواحدة)",
                            style: TextStyle(fontSize: 10, color: green),
                          ),
                          const Padding(
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
                            padding: const EdgeInsets.only(
                              right: 1,
                            ),
                            child:
                            branchCode == 1 && userType == 1
                                      ?
                            Text(
                              (widget.itemsModel.itemspricediscount!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                : branchCode == 2 && userType == 1
                                            ?
                            Text(
                              (widget.itemsModel.itemspricediscount2!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 3 && userType == 1
                                ?
                            Text(
                              (widget.itemsModel.itemspricediscount3!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 4 && userType == 1
                                ?
                            Text(
                              (widget.itemsModel.itemspricediscount4!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 5 && userType == 1
                                ?
                            Text(
                              (widget.itemsModel.itemspricediscount5!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 1 && userType == 2
                                ?
                            Text(
                              (widget.itemsModel.shopownerPriceDiscount!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 2 && userType == 2
                                ?
                            Text(
                              (widget.itemsModel.shopownerPriceDiscount!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 3 && userType == 2
                                ?
                            Text(
                              (widget.itemsModel.shopownerPriceDiscount3!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 4 && userType == 2
                                ?
                            Text(
                              (widget.itemsModel.shopownerPriceDiscount4!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 5 && userType == 2
                                ?
                            Text(
                              (widget.itemsModel.shopownerPriceDiscount5!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 1 && userType == 3
                                ?
                            Text(
                              (widget.itemsModel.fornownerPriceDiscount!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 2 && userType == 3
                                ?
                            Text(
                              (widget.itemsModel.fornownerPriceDiscount2!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 3 && userType == 3
                                ?
                            Text(
                              (widget.itemsModel.fornownerPriceDiscount3!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 4 && userType == 3
                                ?
                            Text(
                              (widget.itemsModel.fornownerPriceDiscount4!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            branchCode == 5 && userType == 3
                                ?
                            Text(
                              (widget.itemsModel.fornownerPriceDiscount5!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
                                :
                            Text(
                              (widget.itemsModel.itemspricediscount!.toStringAsFixed(2)),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 17,
                                  fontFamily: 'ArabicUIDisplay',
                                  fontWeight: FontWeight.bold),
                            )
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
                                onPressed: () {
                                  controller.deleteFromCart(
                                      widget.itemsModel.itemsId,
                                      widget.itemsModel.itemsName
                                  );
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: yellow,
                                )),
                            Text(
                              controller.getCountForItem(widget.itemsModel.itemsId!).toString(),
                              style: const TextStyle(
                                  color: yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.addToCart(
                                      widget.itemsModel.itemsId,
                                      widget.itemsModel.itemsName
                                  );
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: yellow,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ]);
              }
            ),
            InkWell(
              onTap: (){
                Get.off(() => CartOrders());
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: .85 * MediaQuery.sizeOf(context).width,
                height: 40,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
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
                    "اذهب الي العربة ",
                    style: TextStyle(
                        color: green,
                        fontSize: 20,
                        fontFamily: 'ArabicUIDisplay',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
