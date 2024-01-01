import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/app/presentation/screens/client/widgets/custom_pass_container.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import '../../../api_connection/api_connection.dart';
import '../../../core/helper/snack.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/back_image.dart';
import '../../widgets/custom_next.dart';
import '../../widgets/info_row.dart';
import '../auth/otp/otp_for_changepassword.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
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
              SizedBox(
                height: .1 * MediaQuery.sizeOf(context).height,
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
              CustomChangePass(controller: email),
              SizedBox(
                height: .1 * MediaQuery.sizeOf(context).height,
              ),
              GestureDetector(
                  onTap: () {
                    validateUserEmail();
                  },
                  child: CustomNext(text: 'التالي'))
            ],
          ),
        ),
      ]),
    );
  }
}
