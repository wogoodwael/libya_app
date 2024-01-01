import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/app/presentation/screens/client/widgets/custom_pass_container.dart';

import '../../../api_connection/api_connection.dart';
import '../../../core/helper/snack.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/back_image.dart';
import '../../widgets/custom_next.dart';
import '../../widgets/info_row.dart';
import '../auth/login/sign_in.dart';
import '../menu.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  String email = Get.arguments["email_final"];

  resetPassword() async {
    try {
      var res = await http.post(
        Uri.parse(API.resetPass),
        body: {
          'email': email,
          'user_password': pass.text,
        },
      );

      if (res.statusCode == 200) {
        if (kDebugMode) {
          print(email);
        }
        var resBodyOfChangeCode = jsonDecode(res.body);

        if (resBodyOfChangeCode != null) {
          if (resBodyOfChangeCode['status'] == "success") {
            Get.to(() => const SignInScreen());
          } else {
            Get.snackbar('Error', 'Network Error.');
            if (kDebugMode) {
              print('Unexpected status code: ${res.statusCode}');
              print('Response body: ${res.body}');
            }
          }
        } else {
          Get.snackbar('Error', 'Response body is null.');
          if (kDebugMode) {
            print('Response body is null.');
          }
        }
      } else {
        Get.snackbar('Error', 'Failed to reset password.');
        if (kDebugMode) {
          print('Unexpected status code: ${res.statusCode}');
          print('Response body: ${res.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Reset Password error: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  " يجب ان تكون كلمة السر الجديده مختلفه تماما عن القديمه ويجب اتباع التعليمات الخاصه عن وضع كلمة السر",
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
                    fontsize: 20,
                    fontfamily: 'ArabicUIDisplayBold',
                    icon: Icons.error,
                    text: '  كلمة السر الجديدة '),
              ),
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
              CustomChangePass(controller: pass),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: InfoRow(
                    fontsize: 20,
                    fontfamily: 'ArabicUIDisplayBold',
                    icon: Icons.error,
                    text: '  تاكيد كلمة السر الجديدة '),
              ),
              SizedBox(
                height: .01 * MediaQuery.sizeOf(context).height,
              ),
              CustomChangePass(controller: confirmPass),
              SizedBox(
                height: .07 * MediaQuery.sizeOf(context).height,
              ),
              GestureDetector(
                  onTap: (){
                    if(pass.text == confirmPass.text){
                      resetPassword();
                      showSuccessSnack(context, "نجاح");
                    }else{
                      showErrorSnack(context, "كلمات المرور غير متطابقة");
                    }
                  },
                  child: CustomNext(text: 'حفظ')
              )
            ],
          ),
        ),
      ]),
    );
  }
}
