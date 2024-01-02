import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:libya_bakery/app/core/helper/snack.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/presentation/screens/home/home.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import 'package:libya_bakery/app/presentation/screens/orders/widgets/custom_order_details.dart';
import 'package:libya_bakery/app/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/app/services/MyServices.dart';
import '../../../../admin/core/utils/app_color.dart';
import '../../../controller/checkout_controller.dart';
import '../../../controller/orders/order_details_controller.dart';
import '../../../controller/orders/pending_controller.dart';
import '../../../handling_data/handlng_data_view.dart';

class PreviousOrderDetails extends StatefulWidget {
  const PreviousOrderDetails({super.key});

  @override
  State<PreviousOrderDetails> createState() => _PreviousOrderDetailsState();
}

class _PreviousOrderDetailsState extends State<PreviousOrderDetails> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    PendingOrdersController pendingOrdersController = Get.put(PendingOrdersController());
    CheckoutController checkoutController = Get.put(CheckoutController());
    bool visible = false;
    if(controller.ordersModel.orderType == 1){
     setState(() {
       visible = true;
     });
    }
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      backgroundColor: offwhite,
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Stack(children: [
              const BackGroundImage(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: .25 * MediaQuery.sizeOf(context).height,
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
                                width: .01 * MediaQuery.sizeOf(context).width,
                              ),

                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 40,
                                  color: yellow,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),

                              SizedBox(
                                width: .12 * MediaQuery.sizeOf(context).width,
                              ),
                              const Text(
                                "طلباتك السابقة",
                                style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: yellow),
                              ),
                              SizedBox(
                                width: .15 * MediaQuery.sizeOf(context).width,
                              ),
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
                          SizedBox(
                            height: .04 * MediaQuery.sizeOf(context).height,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        width: .90 * MediaQuery.sizeOf(context).width,
                        height: .15 * MediaQuery.sizeOf(context).height,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 121, 119, 119),
                                blurRadius: 1.0,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: .15 * MediaQuery.sizeOf(context).width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "${controller.ordersModel.orderId}#",
                                      style: const TextStyle(
                                          color: darkGreen,
                                          fontFamily: 'ArabicUIDisplay',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                    " : رقم الطلب",
                                    style: TextStyle(
                                        color: darkGreen,
                                        fontFamily: 'ArabicUIDisplay',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                              color: yellow,
                              endIndent: 10,
                              indent: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    "الحالة : ${pendingOrdersController.printOrderStatus(controller.ordersModel.orderStatus.toString())} ",
                                    style: TextStyle(
                                        color: pendingOrdersController.printOrderStatus(controller.ordersModel.orderStatus.toString()) == "Awaiting Approval" ?
                                        Colors.red :
                                        pendingOrdersController.printOrderStatus(controller.ordersModel.orderStatus.toString()) == "Order is Being Prepared" ?
                                        Colors.orange :
                                        pendingOrdersController.printOrderStatus(controller.ordersModel.orderStatus.toString()) == "Order on the Way" ?
                                        Colors.green :
                                        pendingOrdersController.printOrderStatus(controller.ordersModel.orderStatus.toString()) == "Archive" ?
                                        Colors.blue :
                                        Colors.grey,
                                        fontSize: 13,
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    Jiffy.parse(controller.ordersModel.orderDatetime!).format(pattern: 'MMMM do yyyy, h:mm:ss a'),
                                    style: const TextStyle(
                                        color: green,
                                        fontSize: 13,
                                        fontFamily: 'ArabicUIDisplayBold',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .01 * MediaQuery.sizeOf(context).height,
                    ),
                    Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                            width: .90 * MediaQuery.sizeOf(context).width,
                            height: .25 * MediaQuery.sizeOf(context).height,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 121, 119, 119),
                                    blurRadius: 1.0,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      "تفاصيل الطلب ",
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
                                  ...List.generate(controller.data.length,
                                          (index) => CustomOrderDetails(
                                              name: "${controller.data[index].itemsName}",
                                              count: "${controller.data[index].countitems}",
                                          )
                                  ),
                                ],
                              ),
                            )
                        )
                    ),
                    Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                            width: .90 * MediaQuery.sizeOf(context).width,
                            height: .17 * MediaQuery.sizeOf(context).height,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 121, 119, 119),
                                    blurRadius: 1.0,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "المجموع___________________________${controller.ordersModel.orderPrice} د.ل",
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: .01 * MediaQuery.sizeOf(context).height,
                                ),
                                Text(
                                  "اجمالي التوصيل___________________________${controller.ordersModel.orderPricedelivery} د.ل",
                                  style: const TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: .01 * MediaQuery.sizeOf(context).height,
                                ),
                              Text(
                                "اجمالي الفاتورة___________________________${controller.ordersModel.orderTotalprice} د.ل",
                                  style: const TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: .01 * MediaQuery.sizeOf(context).height,
                                ),
                                Text(
                                  controller.ordersModel.orderType == 0 ?
                                "طريقة الدفع___________________________دفع عند المتجر"
                                  : "طريقة الدفع___________________________دفع عند الاستلام",
                                  style: const TextStyle(
                                      color: green,
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))),
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
                          height: .05 * MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 121, 119, 119),
                                  blurRadius: 1.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      " العنوان: ${controller.ordersModel.addressCity} ,  ${controller.ordersModel.addressStreet}",
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                          color: green,
                                          fontSize: 13,
                                          fontFamily: 'ArabicUIDisplayBold',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: visible,
                      child: SizedBox(
                        height: .03 * MediaQuery.sizeOf(context).height,
                      ),
                    ),
                    Visibility(
                      visible: visible,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 300,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),
                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.completercontroller!.complete(controllermap);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    InkWell(
                      onTap: (){
                        Get.dialog(AlertDialog(
                          backgroundColor: Colors.white,
                          title: const Text(
                            'اعادة الطلب',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          content: const Text('هل أنت متأكد أنك تريد اعادة الطلب؟',style: TextStyle(fontFamily: 'ArabicUIDisplayBold',),),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'لا',
                                  style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
                                )),
                            TextButton(
                                onPressed: () {
                                  // checkoutController.choosePaymentMethod(controller.ordersModel.);
                                  checkoutController.chooseDeliveryType(controller.ordersModel.orderType.toString());
                                  checkoutController.chooseShippingAddress(controller.ordersModel.addressId ?? 0);
                                  checkoutController.checkout(int.parse(MyServicesApp.sharedPreferences.getString("id").toString()),
                                      controller.ordersModel.orderAmountPaid.toString(),
                                      controller.ordersModel.noOfInstallments.toString(),
                                  );
                                  Get.to(() => const HomeScreen());
                                  showErrorSnack(context, "تم اعادة الطلب بنجاح");
                                },
                                child: const Text(
                                  'نعم',
                                  style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
                                ))
                          ],
                        ));
                      },
                        child: CustomNext(text: 'اعادة الطلب')
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
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
