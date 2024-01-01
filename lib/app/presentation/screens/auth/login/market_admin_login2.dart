import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/admin/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/app/core/utils/logo.dart';
import 'package:libya_bakery/app/presentation/widgets/info_row.dart';
import 'package:libya_bakery/app/presentation/widgets/text_field.dart';
import '../../../../api_connection/api_connection.dart';
import '../../../../controller/address/add_details_controller.dart';
import '../../../../core/helper/snack.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../handling_data/handlng_data_view.dart';
import '../../../../services/MyServices.dart';

class MarketLoginScreen2 extends StatefulWidget {
  const MarketLoginScreen2({super.key});

  @override
  State<MarketLoginScreen2> createState() => _MarketLoginScreen2State();
}

class _MarketLoginScreen2State extends State<MarketLoginScreen2> {
  AddressDetailsController controller = Get.put(AddressDetailsController());

  validateUserEmail() async{
    try{
      var res = await http.post(
          Uri.parse(API.validateStoreName),
          body: {
            'store_name':controller.name!.text.trim(),
            "email" : MyServices.sharedPreferences.getString("email").toString()
          }
      );
      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = jsonDecode(res.body);
        if (resBodyOfValidateEmail['status'] == "success") {
          showErrorSnack(context, "Store Already Exisit");
        } else {
          controller.addAddress();
        }
      }  else{
        if (kDebugMode) {
          print('Unexpected status code: ${res.statusCode}');
          print('Response body: ${res.body}');
        }
      }
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      body: GetBuilder<AddressDetailsController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Stack(children: [
                Image.asset(
                  "assets/images/back.png",
                  color: Colors.grey.withOpacity(.2),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                    child: ListView(
                        children:[
                          Column(
                            children: [
                              const Logo(),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 3,
                                color: darkGreen,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Center(
                                child: Text(
                                  "يرجي ادخال المعلومات الاتية ",
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplay',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: green),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                                child: InfoRow(
                                  fontsize: 18,
                                  text: 'العنوان ',
                                  fontfamily: 'ArabicUIDisplay',
                                ),
                              ),
                              CustomTextField(
                                height: 40,
                                secure: false,
                                controller: controller.street,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                                child: InfoRow(
                                  fontsize: 18,
                                  text: 'المدينة ',
                                  fontfamily: 'ArabicUIDisplay',
                                ),
                              ),
                              CustomTextField(
                                height: 40,
                                secure: false,
                                controller: controller.city,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                  onTap: (){
                                     validateUserEmail();
                                     // controller.addAddress();
                                  },
                                  child: Center(child: CustomNext(width: 310, text: 'اضافة العنوان')))
                            ],
                          ),
                        ]
                    ))
              ])
          );
        }
      ),
    );
  }
}
