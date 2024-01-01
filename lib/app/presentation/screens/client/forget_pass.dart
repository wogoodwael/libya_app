import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/presentation/screens/auth/otp/otp_for_changepassword.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import 'package:libya_bakery/app/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/app/presentation/widgets/info_row.dart';
import '../../../../admin/core/utils/app_color.dart';
import '../../../api_connection/api_connection.dart';
import '../../../core/helper/snack.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController email = TextEditingController();

  validateUserEmail() async{
    try{
      var res = await http.post(
          Uri.parse(API.validateEmail),
          body: {
            'email':email.text.trim()
          }
      );
      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = jsonDecode(res.body);
        if (resBodyOfValidateEmail['status'] == "success") {
          changeVerifyCode();
          if (kDebugMode) {
            print(email.text);
          }
          Get.off(() => const OtpForChangePasswordScreen(),arguments: {
            "email" : email.text
          });
        } else {
          showErrorSnack(context, "لم يتم العثور علي البريد الالكتروني");
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
  changeVerifyCode() async{
    try{
      var res = await http.post(
          Uri.parse(API.changeVerifyCode),
          body: {
            'email':email.text.trim()
          }
      );
      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = jsonDecode(res.body);
        if (resBodyOfValidateEmail['status'] == "success") {
          showErrorSnack(context, "تم ارسال رمز التاكيد الي بريدك");
        } else {
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: .18 * MediaQuery.sizeOf(context).height,
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
                          width: .04 * MediaQuery.sizeOf(context).width,
                        ),
                        const Text(
                          " تغيير كلمة السر",
                          style: TextStyle(
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: yellow),
                        ),
                        SizedBox(
                          width: .02 * MediaQuery.sizeOf(context).width,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: .04 * MediaQuery.sizeOf(context).height,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: .05 * MediaQuery.sizeOf(context).height,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 5),
                child: Text(
                  "تغير كلمه السر",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplay',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: green),
                ),
              ),
              const Divider(
                thickness: 2,
                color: darkGreen,
                endIndent: 10,
                indent: 10,
              ),
              SizedBox(
                height: .03 * MediaQuery.sizeOf(context).height,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ادخل البريد الالكتروني خاصتك لكي تستطيع استعاده كلمه السر الخاصه بك او تغيرها",
                  style: TextStyle(
                    fontFamily: 'ArabicUIDisplayBold',
                    fontSize: 19,
                    color: darkGreen,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 30),
                child: InfoRow(
                    fontsize: 25,
                    fontfamily: 'ArabicUIDisplayBold',
                    icon: Icons.error,
                    text: ' البريد الالكتروني '),
              ),
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: .06 * MediaQuery.sizeOf(context).width),
                width: .90 * MediaQuery.sizeOf(context).width,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: email,
                  obscureText: false,
                  textAlign: TextAlign.end,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'xxxxxxxxx'),
                ),
              ),
              SizedBox(
                height: .1 * MediaQuery.sizeOf(context).height,
              ),
              InkWell(
                onTap: (){
                  validateUserEmail();
                },
                  child: CustomNext(text: 'التالي')
              )
            ],
          ),
        ),
      ]),
    );
  }
}
