import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/utils/app_color.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/core/utils/person.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import 'package:libya_bakery/app/presentation/widgets/custom_next.dart';
import '../../../controller/cart_controller.dart';
import '../../../controller/checkout_controller.dart';
import '../../../controller/user_controller.dart';
import '../../../core/helper/snack.dart';
import '../../../handling_data/handlng_data_view.dart';
import '../../../services/MyServices.dart';
import '../../widgets/payment_method_button.dart';
import '../address/address_view.dart';
import '../address/custom_shipping_card.dart';
import 'card_order.dart';
import 'widgets/custom_confirm_items_list.dart';

enum SingingCharacter { lafayette, jefferson }

class ConfirmOrders extends StatefulWidget {
  const ConfirmOrders({super.key});

  @override
  State<ConfirmOrders> createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends State<ConfirmOrders> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CartController cartController = Get.put(CartController());
  var branchCode = int.parse(MyServices.sharedPreferences.getString("branch_code").toString());
  var userType = int.parse(MyServices.sharedPreferences.getString("user_type").toString());
  CheckoutController controller = Get.put(CheckoutController());
  bool visible = false;
  bool ta2sitVisible = false;
  bool button1 = false;
  bool button2 = false;
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      backgroundColor: offwhite,
      body: GetBuilder<CheckoutController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Stack(
                children: [
              const BackGroundImage(),
              SingleChildScrollView(
                child: Column(
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
                                "تاكيد الطلب ",
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
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                          width: .90 * MediaQuery.sizeOf(context).width,
                          height: .50 * MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 121, 119, 119),
                              blurRadius: 1.0,
                            ),
                          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            child:
                              Column(
                                children: [
                                  SizedBox(
                                    height: .01 * MediaQuery.sizeOf(context).height,
                                  ),
                                  const Text(
                                    "تفاصيل الطلب ",
                                    style: TextStyle(
                                        color: darkGreen,
                                        fontFamily: 'ArabicUIDisplay',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Divider(
                                    thickness: 2,
                                    color: yellow,
                                    endIndent: 10,
                                    indent: 10,
                                  ),
                                  ...List.generate(
                                      cartController.data.length,
                                          (index) => CustomConfirmItemsList(
                                        name: "${cartController.data[index].itemsName}",
                                        price:
                                        branchCode == 1 && userType == 1
                                            ?
                                        (cartController.data[index].itemsprice)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 2 && userType == 1
                                            ?
                                        (cartController.data[index].itemsprice2)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 3 && userType == 1
                                            ?
                                        (cartController.data[index].itemsprice3)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 4 && userType == 1
                                            ?
                                        (cartController.data[index].itemsprice4)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 5 && userType == 1
                                            ?
                                        (cartController.data[index].itemsprice5)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 1 && userType == 2
                                            ?
                                        (cartController.data[index].shopownerprice)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 2 && userType == 2
                                            ?
                                        (cartController.data[index].shopownerprice2)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 3 && userType == 2
                                            ?
                                        (cartController.data[index].shopownerprice3)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 4 && userType == 2
                                            ?
                                        (cartController.data[index].shopownerprice4)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 5 && userType == 2
                                            ?
                                        (cartController.data[index].shopownerprice5)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 1 && userType == 3
                                            ?
                                        (cartController.data[index].fornownerprice)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 2 && userType == 3
                                            ?
                                        (cartController.data[index].fornownerprice2)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 3 && userType == 3
                                            ?
                                        (cartController.data[index].fornownerprice3)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 4 && userType == 3
                                            ?
                                        (cartController.data[index].fornownerprice4)!
                                            .toStringAsFixed(2)
                                            :
                                        branchCode == 5 && userType == 3
                                            ?
                                        (cartController.data[index].fornownerprice5)!
                                            .toStringAsFixed(2)
                                            :
                                        (cartController.data[index].itemsprice)!
                                            .toStringAsFixed(2),
                                        count:
                                        "${cartController.data[index].countitems}",
                                        image:
                                        '${cartController.data[index].itemsImage}',
                                        discount:
                                        '${cartController.data[index].itemsDiscount}',
                                      ))
                                ],
                              ),
                          )),
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                button1 = true;
                                // controller.choosePaymentMethod("0");
                                controller.chooseDeliveryType("0");
                                setState(() {
                                  visible = false;
                                });
                                Get.dialog(AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text(
                                    'طريقة الدفع',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text('هل تريد دفع المبلغ كامل ام دفعات؟',style: TextStyle(fontFamily: 'ArabicUIDisplayBold',),),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            ta2sitVisible = false;
                                          });
                                          Get.back();
                                          controller.choosePaymentMethod("0");
                                        },
                                        child: const Text(
                                          'كامل كاش',
                                          style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            ta2sitVisible = true;
                                          });
                                          Get.back();
                                          controller.choosePaymentMethod("1");
                                        },
                                        child: const Text(
                                          'دفعات',
                                          style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
                                        ))
                                  ],
                                ));
                              },
                              child: PaymentMethodButton(
                                  text: 'دفع من المتجر',
                                isActive: controller.deliveryType == "0" ? true : false,
                              )),
                        ),
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                button2 = true;
                                // controller.choosePaymentMethod("1");
                                controller.chooseDeliveryType("1");
                                setState(() {
                                  visible = true;
                                });
                                Get.dialog(AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text(
                                    'طريقة الدفع',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text('هل تريد دفع المبلغ كامل ام دفعات؟',style: TextStyle(fontFamily: 'ArabicUIDisplayBold',),),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            ta2sitVisible = false;
                                          });

                                          Get.back();
                                          controller.choosePaymentMethod("0");
                                        },
                                        child: const Text(
                                          'كامل كاش',
                                          style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            ta2sitVisible = true;
                                          });
                                          Get.back();
                                          controller.choosePaymentMethod("1");
                                        },
                                        child: const Text(
                                          'دفعات',
                                          style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
                                        ))
                                  ],
                                ));
                              },
                              child: PaymentMethodButton(text: 'دفع عند الاستلام',
                                isActive: controller.deliveryType == "1" ? true : false,)),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: visible,
                      child: SizedBox(
                        height: .03 * MediaQuery.sizeOf(context).height,
                      ),
                    ),
                    Visibility(
                      visible: visible,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          width: .90 * MediaQuery.sizeOf(context).width,
                          height: .41 * MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 121, 119, 119),
                              blurRadius: 1.0,
                            ),
                          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 15, right: 5),
                                  child: Text(
                                    " : اختار عنوان للشحن اليه  ",
                                    style: TextStyle(
                                        color: darkGreen,
                                        fontFamily: 'ArabicUIDisplay',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                  color: yellow,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                if(controller.data.isNotEmpty)
                                  ...List.generate(
                                      controller.data.length,
                                          (index) => InkWell(
                                        onTap: (){
                                          controller.chooseShippingAddress(controller.data[index].addressId!);
                                        },
                                        child: CustomShippingCard(
                                            title: controller.data[index].addressName!,
                                            body: "${controller.data[index].addressCity!}, ${controller.data[index].addressStreet!}",
                                            isActive: controller.shippingId == controller.data[index].addressId! ? true : false
                                        ),
                                      )
                                  ),
                                const Divider(
                                  thickness: 2,
                                  color: darkGreen,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(() => const AddressView());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: .2 * MediaQuery.sizeOf(context).width),
                                    width: 200,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            // offset: Offset(0, 0),
                                              color: Color.fromARGB(255, 187, 186, 186),
                                              blurRadius: 1,
                                              spreadRadius: 2)
                                        ],
                                        color: darkGreen,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: const Center(
                                      child: Text(
                                        "اضف عنوان اخر",
                                        style: TextStyle(
                                            fontFamily: 'ArabicUIDisplay',
                                            color: yellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    Visibility(
                      visible: ta2sitVisible,
                      child: SizedBox(
                        height: .03 * MediaQuery.sizeOf(context).height,
                      ),
                    ),
                    Visibility(
                      visible: ta2sitVisible,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          width: .90 * MediaQuery.sizeOf(context).width,
                          height: .15 * MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 121, 119, 119),
                              blurRadius: 1.0,
                            ),
                          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 15, right: 5),
                                  child: Text(
                                    " : الدفعه اللتي تريد دفعها",
                                    style: TextStyle(
                                        color: darkGreen,
                                        fontFamily: 'ArabicUIDisplay',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                  color: yellow,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: .6 * MediaQuery.sizeOf(context).width,
                                    height: .07 * MediaQuery.sizeOf(context).height,
                                    child: TextField(
                                      controller: controller.ta2sitController,
                                      decoration: const InputDecoration(
                                        hintText: "1000"
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    GestureDetector(
                        onTap: () {
                          if(button1 == true || button2 == true){
                            controller.checkout(
                                int.parse(MyServices.sharedPreferences.getString("id").toString()),
                                controller.ta2sitController.text
                            );
                            userController.getData();
                            button1 = false;
                            button2 = false;
                          } else {
                            showErrorSnack(context, "من فضلك اختار طريقه الدفع");
                          }
                        },
                        child: CustomNext(text: 'تاكيد')),
                    SizedBox(
                      height: .02 * MediaQuery.sizeOf(context).height,
                    ),
                  ],
                ),
              ),
            ]),
          );
        }
      ),
    );
  }
}
