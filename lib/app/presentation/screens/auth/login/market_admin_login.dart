import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/admin/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/app/core/utils/logo.dart';
import 'package:libya_bakery/app/presentation/screens/address/add.dart';
import 'package:libya_bakery/app/presentation/widgets/info_row.dart';
import 'package:libya_bakery/app/presentation/widgets/text_field.dart';
import 'package:libya_bakery/app/services/MyServices.dart';
import '../../../../../admin/core/utils/app_color.dart';
import '../../../../api_connection/api_connection.dart';
import '../../../../core/helper/snack.dart';
import '../../../widgets/phone_row.dart';

class MarketLoginScreen extends StatefulWidget {
  const MarketLoginScreen({super.key});

  @override
  State<MarketLoginScreen> createState() => _MarketLoginScreenState();
}

class _MarketLoginScreenState extends State<MarketLoginScreen> {
  bool secure = true;
  TextEditingController storeName = TextEditingController();
  TextEditingController storeEmail = TextEditingController();
  TextEditingController storePassword = TextEditingController();
  TextEditingController storeMobile = TextEditingController();


  validateUserEmail() async{
    try{
      var res = await http.post(
          Uri.parse(API.validateEmail),
          body: {
            'email':storeEmail.text.trim()
          }
      );
      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = jsonDecode(res.body);
        if (resBodyOfValidateEmail['status'] == "success") {
          showErrorSnack(context, "Email Already Exisit");
        } else {
          registerAndSaveUserRecord();
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

  registerAndSaveUserRecord() async{
    try{
      var res = await http.post(
        Uri.parse(API.signUp),
        body: {
          'first_name':storeName.text.trim(),
          'last_name':storeName.text.trim(),
          'email':storeEmail.text.trim(),
          'mobile':storeMobile.text.trim(),
          'user_password':storePassword.text.trim(),
          'userType':2.toString()
        },
      );
      if(res.statusCode == 200){
        var resBodyOfSignUp = jsonDecode(res.body);
        if (resBodyOfSignUp['status'] == 'success') {
          showErrorSnack(context, "Sign Up Successfully");

          MyServicesApp.sharedPreferences.setString('id', resBodyOfSignUp['data']['user_id'].toString());
          MyServicesApp.sharedPreferences.setString('first_name', resBodyOfSignUp['data']['first_name']);
          MyServicesApp.sharedPreferences.setString('last_name', resBodyOfSignUp['data']['last_name']);
          MyServicesApp.sharedPreferences.setString('email', resBodyOfSignUp['data']['email']);
          MyServicesApp.sharedPreferences.setString('mobile', resBodyOfSignUp['data']['mobile']);
          MyServicesApp.sharedPreferences.setString('branch_code', resBodyOfSignUp['data']['branch_code'].toString());
          MyServicesApp.sharedPreferences.setString('user_type', resBodyOfSignUp['data']['user_type'].toString());

          Get.to(() => const AddAddressView(), arguments: [
            {'id' : MyServicesApp.sharedPreferences.getString('id')},
            {'first_name' : MyServicesApp.sharedPreferences.getString('first_name')},
            {'last_name' : MyServicesApp.sharedPreferences.getString('last_name')},
            {'email' : MyServicesApp.sharedPreferences.getString('email')},
            {'mobile' : MyServicesApp.sharedPreferences.getString('mobile')},
            {'branch_code' : MyServicesApp.sharedPreferences.getString('branch_code')},
            {'user_type' : MyServicesApp.sharedPreferences.getString('user_type')},
          ]);
        } else {
          showErrorSnack(context, "Error, Try Again");
          if (kDebugMode) {
            print('Unexpected status code: ${res.statusCode}');
            print('Response body: ${res.body}');
          }
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
      body: Stack(children: [
        Image.asset(
          "assets/images/back.png",
          color: Colors.grey.withOpacity(.2),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: SingleChildScrollView(
          child: Column(
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
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 5),
                child: InfoRow(
                    fontsize: 18,
                    fontfamily: 'ArabicUIDisplay',
                    text: 'اسم المتجر'),
              ),
              CustomTextField(
                height: 40,
                secure: false,
                controller: storeName,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 5),
                child: InfoRow(
                    fontsize: 18,
                    fontfamily: 'ArabicUIDisplay',
                    text: 'البريد الالكتروني للمتجر'),
              ),
              CustomTextField(
                height: 40,
                secure: false,
                controller: storeEmail,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 5),
                child: InfoRow(
                    fontsize: 18,
                    fontfamily: 'ArabicUIDisplay',
                    text: 'رقم هاتف المتجر'),
              ),
              Container(
                margin: EdgeInsets.only(right: Get.size.width * 0.06),
                child: CustomPhoneTextField(
                  controller: storeMobile,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 5),
                child: InfoRow(
                    fontsize: 18,
                    fontfamily: 'ArabicUIDisplay',
                    text: 'كلمة السر للمتجر'),
              ),
              CustomTextField(
                height: 35,
                secure: secure,
                perfix: secure
                    ? IconButton(
                  icon: const Icon(
                    Icons.visibility_off,
                    color: green,
                  ),
                  onPressed: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                )
                    : IconButton(
                  icon: const Icon(
                    Icons.visibility,
                    color: green,
                  ),
                  onPressed: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                ),
                controller: storePassword,
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async{
                    await validateUserEmail();
                  },
                  child: Center(child: CustomNext(width: 310, text: 'التالي ')))
            ],
          ),
        ))
      ]),
    );
  }
}
