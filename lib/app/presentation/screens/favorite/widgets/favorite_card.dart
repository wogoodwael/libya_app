import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/services/MyServices.dart';
import '../../../../api_connection/api_connection.dart';
import '../../../../controller/myfavorite_controller.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../models/favorites_model.dart';

class FavoriteCard extends GetView<MyFavoriteController> {
  final FavoriteModel favoriteModel;

  const FavoriteCard({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    var branchCode = int.parse(
        MyServicesApp.sharedPreferences.getString("branch_code").toString());
    var userType = int.parse(
        MyServicesApp.sharedPreferences.getString("user_type").toString());
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 1 * MediaQuery.sizeOf(context).width,
        height: .19 * MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 121, 119, 119),
            blurRadius: 1.0,
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
                children: [
              Container(
                width: 125,
                height: 120,
                margin: const EdgeInsets.only(
                  top: 15,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.network(
                  '${API.itemsImages}/${favoriteModel.itemsImage}',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(width: Get.width * 0.02,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5, top: 10),
                    child: Text(
                      favoriteModel.itemsName!,
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
                      favoriteModel.itemsDesc!,
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
                          child: branchCode == 1 && userType == 1
                              ? Text(
                                  (favoriteModel.itemsPrice!
                                      .toStringAsFixed(2)),
                                  style: const TextStyle(
                                      color: yellow,
                                      fontSize: 17,
                                      fontFamily: 'ArabicUIDisplay',
                                      fontWeight: FontWeight.bold),
                                )
                              : branchCode == 2 && userType == 1
                                  ? Text(
                                      (favoriteModel.itemsPrice2!
                                          .toStringAsFixed(2)),
                                      style: const TextStyle(
                                          color: yellow,
                                          fontSize: 17,
                                          fontFamily: 'ArabicUIDisplay',
                                          fontWeight: FontWeight.bold),
                                    )
                                  : branchCode == 3 && userType == 1
                                      ? Text(
                                          (favoriteModel.itemsPrice3!
                                              .toStringAsFixed(2)),
                                          style: const TextStyle(
                                              color: yellow,
                                              fontSize: 17,
                                              fontFamily: 'ArabicUIDisplay',
                                              fontWeight: FontWeight.bold),
                                        )
                                      : branchCode == 4 && userType == 1
                                          ? Text(
                                              (favoriteModel.itemsPrice4!
                                                  .toStringAsFixed(2)),
                                              style: const TextStyle(
                                                  color: yellow,
                                                  fontSize: 17,
                                                  fontFamily: 'ArabicUIDisplay',
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : branchCode == 5 && userType == 1
                                              ? Text(
                                                  (favoriteModel.itemsPrice5!
                                                      .toStringAsFixed(2)),
                                                  style: const TextStyle(
                                                      color: yellow,
                                                      fontSize: 17,
                                                      fontFamily:
                                                          'ArabicUIDisplay',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : branchCode == 1 && userType == 2
                                                  ? Text(
                                                      (favoriteModel
                                                          .shopownerPrice!
                                                          .toStringAsFixed(2)),
                                                      style: const TextStyle(
                                                          color: yellow,
                                                          fontSize: 17,
                                                          fontFamily:
                                                              'ArabicUIDisplay',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : branchCode == 2 &&
                                                          userType == 2
                                                      ? Text(
                                                          (favoriteModel
                                                              .shopownerPrice2!
                                                              .toStringAsFixed(
                                                                  2)),
                                                          style: const TextStyle(
                                                              color: yellow,
                                                              fontSize: 17,
                                                              fontFamily:
                                                                  'ArabicUIDisplay',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : branchCode == 3 &&
                                                              userType == 2
                                                          ? Text(
                                                              (favoriteModel
                                                                  .shopownerPrice3!
                                                                  .toStringAsFixed(
                                                                      2)),
                                                              style: const TextStyle(
                                                                  color: yellow,
                                                                  fontSize: 17,
                                                                  fontFamily:
                                                                      'ArabicUIDisplay',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          : branchCode == 4 &&
                                                                  userType == 2
                                                              ? Text(
                                                                  (favoriteModel
                                                                      .shopownerPrice4!
                                                                      .toStringAsFixed(
                                                                          2)),
                                                                  style: const TextStyle(
                                                                      color:
                                                                          yellow,
                                                                      fontSize:
                                                                          17,
                                                                      fontFamily:
                                                                          'ArabicUIDisplay',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )
                                                              : branchCode ==
                                                                          5 &&
                                                                      userType ==
                                                                          2
                                                                  ? Text(
                                                                      (favoriteModel
                                                                          .shopownerPrice5!
                                                                          .toStringAsFixed(
                                                                              2)),
                                                                      style: const TextStyle(
                                                                          color:
                                                                              yellow,
                                                                          fontSize:
                                                                              17,
                                                                          fontFamily:
                                                                              'ArabicUIDisplay',
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  : branchCode ==
                                                                              1 &&
                                                                          userType ==
                                                                              3
                                                                      ? Text(
                                                                          (favoriteModel
                                                                              .fornownerPrice!
                                                                              .toStringAsFixed(2)),
                                                                          style: const TextStyle(
                                                                              color: yellow,
                                                                              fontSize: 17,
                                                                              fontFamily: 'ArabicUIDisplay',
                                                                              fontWeight: FontWeight.bold),
                                                                        )
                                                                      : branchCode == 2 &&
                                                                              userType == 3
                                                                          ? Text(
                                                                              (favoriteModel.fornownerPrice2!.toStringAsFixed(2)),
                                                                              style: const TextStyle(color: yellow, fontSize: 17, fontFamily: 'ArabicUIDisplay', fontWeight: FontWeight.bold),
                                                                            )
                                                                          : branchCode == 3 && userType == 3
                                                                              ? Text(
                                                                                  (favoriteModel.fornownerPrice3!.toStringAsFixed(2)),
                                                                                  style: const TextStyle(color: yellow, fontSize: 17, fontFamily: 'ArabicUIDisplay', fontWeight: FontWeight.bold),
                                                                                )
                                                                              : branchCode == 4 && userType == 3
                                                                                  ? Text(
                                                                                      (favoriteModel.fornownerPrice4!.toStringAsFixed(2)),
                                                                                      style: const TextStyle(color: yellow, fontSize: 17, fontFamily: 'ArabicUIDisplay', fontWeight: FontWeight.bold),
                                                                                    )
                                                                                  : branchCode == 5 && userType == 3
                                                                                      ? Text(
                                                                                          (favoriteModel.fornownerPrice5!.toStringAsFixed(2)),
                                                                                          style: const TextStyle(color: yellow, fontSize: 17, fontFamily: 'ArabicUIDisplay', fontWeight: FontWeight.bold),
                                                                                        )
                                                                                      : Text(
                                                                                          (favoriteModel.itemsPrice!.toStringAsFixed(2)),
                                                                                          style: const TextStyle(color: yellow, fontSize: 17, fontFamily: 'ArabicUIDisplay', fontWeight: FontWeight.bold),
                                                                                        )),
                    ],
                  ),
                ],
              ),
                  IconButton(
                      onPressed: () {
                        controller.deleteFromFav(favoriteModel.favoriteId);
                        controller.deleteFav(favoriteModel.favoriteId);
                      },
                      icon: const Icon(Icons.delete)),
            ]),
          ],
        ),
      ),
    );
  }
}
