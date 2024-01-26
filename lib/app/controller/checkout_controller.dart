import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/controller/product_details_controller.dart';
import '../../admin/handling_data/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/datasource/remote/checkout_data.dart';
import '../models/address_model.dart';
import '../presentation/screens/cart/last_page.dart';
import '../services/MyServices.dart';
import 'orders/order_details_controller.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  StatusRequest statusRequest = StatusRequest.success;
  TextEditingController ta2sitController = TextEditingController();
  TextEditingController noOfTa2sitController = TextEditingController();

  String? paymentMethod;
  String? deliveryType;
  int? shippingId;

  List<AddressModel> data = [];
  late String priceorders;
  ProductDetailsControllerImp productDetailsController =
      Get.put(ProductDetailsControllerImp());
  OrderDetailsController orderDetailsController =
      Get.put(OrderDetailsController());

  choosePaymentMethod(String val){
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(int val) {
    shippingId = val;
    update();
  }

  deleteAllFromCart(int userId) async {
    statusRequest = StatusRequest.loading;
    var response = await checkoutData.deleteAllFromCart(
        int.parse(MyServicesApp.sharedPreferences.getString('id').toString()));
    statusRequest = handlingData(response);
    try {
      if (response['status'] == 'failure') {
        statusRequest = StatusRequest.failure;
      } else {
        if (StatusRequest.success == statusRequest) {
          if (data.isEmpty) {
            statusRequest = StatusRequest.failure;
          }
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.serverfailure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
    update();
  }

  checkout(userId, String amountPaid, String noOfInstallments) async {
    DateTime now = DateTime.now();
    if (now.hour >= 0 && now.hour < 12) {
      Get.snackbar("", "",
          titleText: const Text(
            "خطأ",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'ArabicUIDisplayBold',
            ),
          ),
          messageText: const Text("لا يمكن الطلب بعد الساعه 12",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'ArabicUIDisplayBold',
              )),
          backgroundColor: Colors.red);
    } else {
      if (deliveryType == null) return Get.snackbar("Error", 'Please choose Delivery Method');
      if(paymentMethod == null) return Get.snackbar("Error", 'Please choose Payment Method');
      statusRequest = StatusRequest.loading;
      Map data = {
        "userid": MyServicesApp.sharedPreferences.getString('id').toString(),
        "addressid": shippingId.toString(),
        "ordertype": deliveryType.toString(),
        "orderpricedelivery": "5",
        "order_amountPaid": amountPaid,
        "order_noofinstallments": noOfInstallments,
        "order_amountRequired": (double.tryParse(priceorders)! - (double.tryParse(amountPaid) ?? 0)).toString(),
        "orderprice": priceorders,
        "orderpaymentmethod" : paymentMethod,
        "orderbranch":
            MyServicesApp.sharedPreferences.getString("branch_code").toString(),
      };
      var response = await checkoutData.getData(data);
      statusRequest = handlingData(response);
      try {
        if (response['status'] == 'failure') {
          statusRequest = StatusRequest.failure;
          Get.snackbar("Error", "Please try Again");
        } else {
          if (StatusRequest.success == statusRequest) {
            deleteAllFromCart(userId);
            Get.offAll(() => LastPage());
            Get.snackbar("", "",
                titleText: const Text(
                  "نجاح",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ArabicUIDisplayBold',
                  ),
                ),
                messageText: const Text("تم وضع الطلب بنجاح",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ArabicUIDisplayBold',
                    )),
                backgroundColor: Colors.green);
            if (data.isEmpty) {
              statusRequest = StatusRequest.failure;
            }
            statusRequest = StatusRequest.success;
          } else {
            statusRequest = StatusRequest.serverfailure;
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print("error $e");
        }
      }
      update();
    }
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(
        int.parse(MyServicesApp.sharedPreferences.getString('id').toString()));
    statusRequest = handlingData(response);
    try {
      if (response['status'] == 'failure') {
        statusRequest = StatusRequest.failure;
      } else {
        if (StatusRequest.success == statusRequest) {
          List listData = response['data'];
          data.addAll(listData.map((e) => AddressModel.fromJson(e)));
          if (data.isEmpty) {
            statusRequest = StatusRequest.failure;
          }
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.serverfailure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    priceorders =
        Get.arguments['priceorder'] ?? orderDetailsController.totalPrice;
    getShippingAddress();
  }
}
