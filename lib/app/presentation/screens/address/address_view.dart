import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/address/view_controller.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/back_image.dart';
import '../../../core/utils/person.dart';
import '../../../handling_data/handlng_data_view.dart';
import '../cart/card_order.dart';
import '../menu.dart';
import 'add2_user.dart';
import 'custom_shipping_card_view.dart';
import 'edit_location_user.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: () {
          Get.to(() => const AddAddressView2User());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      endDrawer: const Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      backgroundColor: offwhite,
      body: GetBuilder<AddressViewController>(
        builder: (controller) {
          return Stack(
            children: [
              const BackGroundImage(),
              Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: .2 * MediaQuery.sizeOf(context).height,
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
                              width: .055 * MediaQuery.sizeOf(context).width,
                            ),
                            const Person(),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => CartOrders());
                              },
                              child: const Icon(
                                Icons.shopping_cart_rounded,
                                size: 40,
                                color: yellow,
                              ),
                            ),
                            SizedBox(
                              width: .08 * MediaQuery.sizeOf(context).width,
                            ),
                            const Text(
                              "العناوين ",
                              style: TextStyle(
                                  fontFamily: 'ArabicUIDisplayBold',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: yellow),
                            ),
                            SizedBox(
                              width: .15 * MediaQuery.sizeOf(context).width,
                            ),
                            //* go to menu page
                            GestureDetector(
                                onTap: () {
                                  scaffoldKey.currentState!.openEndDrawer();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: SizedBox(
                                    width: 30,
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
                  SizedBox(
                    height: .02 * MediaQuery.sizeOf(context).height,
                  ),
                  SizedBox(
                    height: 0.7 * MediaQuery.sizeOf(context).height,
                    child: HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(10),
                              child: CustomShippingCardView(
                                title: controller.data[index].addressName!,
                                body:
                                    "${controller.data[index].addressCity!}, ${controller.data[index].addressStreet!}",
                                    onDelete: (){
                                      controller.deleteAddress(
                                          controller.data[index].addressId!);
                                    },
                                onEdit: (){
                                  Get.to(() => const EditLocationUser(),arguments: {
                                    "addressId" : controller.data[index].addressId!
                                  });
                                },
                              ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
