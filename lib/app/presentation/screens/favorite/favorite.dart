import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/presentation/screens/client/profile.dart';
import 'package:libya_bakery/app/presentation/screens/favorite/widgets/favorite_card.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import '../../../controller/myfavorite_controller.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/back_image.dart';
import '../../../handling_data/handlng_data_view.dart';
import '../cart/card_order.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
        key: scaffoldKey,
        endDrawer: const Drawer(
          width: 250,
          child: MenuScreen(),
        ),
        backgroundColor: offwhite,
        body: Stack(children: [
          const BackGroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: .22 * MediaQuery.sizeOf(context).height,
                  decoration: const BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: .08 * MediaQuery.sizeOf(context).height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: .02 * MediaQuery.sizeOf(context).width,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(() => ProfileScreen());
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                "assets/images/person.png",
                                fit: BoxFit.cover,
                                color: yellow,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(() => CartOrders());
                            },
                            child: const Icon(
                              Icons.shopping_cart_rounded,
                              size: 40,
                              color: yellow,
                            ),
                          ),
                          const Text(
                            "منتجاتك المفضلة ",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: yellow),
                          ),
                          //^ go to menu page
                          GestureDetector(
                              onTap: () {
                                scaffoldKey.currentState!.openEndDrawer();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: SizedBox(
                                  width: 32,
                                  height: 25,
                                  child: Image.asset(
                                    "assets/images/icon_menu.png",
                                    color: yellow,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                GetBuilder<MyFavoriteController>(builder: (controller) {
                  return HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                                return FavoriteCard(
                                favoriteModel: controller.data[index]
                                );
                          })
                  );
                }),
              ],
            ),
          ),
        ]));
  }
}
