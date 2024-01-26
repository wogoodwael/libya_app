// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/app/presentation/widgets/check_box.dart';
import 'package:libya_bakery/app/presentation/widgets/custom_choose.dart';
import 'package:libya_bakery/app/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/app/presentation/widgets/phone_row.dart';
import 'package:libya_bakery/app/presentation/widgets/text_field.dart';
import 'package:libya_bakery/app/core/helper/snack.dart';
import 'package:libya_bakery/app/presentation/screens/auth/otp/otp.dart';
import 'package:libya_bakery/app/presentation/widgets/info_row.dart';
import 'package:libya_bakery/app/services/MyServices.dart';

import '../../../../../../admin/core/utils/app_color.dart';
import '../../../../../api_connection/api_connection.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool secure = true;
  bool secure2 = true;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userPass2 = TextEditingController();

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
          showErrorSnack(context, "Email Already Taken");
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
          'first_name':firstName.text.trim(),
          'last_name':lastName.text.trim(),
          'email':email.text.trim(),
          'mobile':mobile.text.trim(),
          'user_password':userPass.text.trim(),
          'userType':1.toString()
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

          Get.to(() => const OtpScreen(), arguments: [
            {'id' : MyServicesApp.sharedPreferences.getString('id')},
            {'first_name' : MyServicesApp.sharedPreferences.getString('first_name')},
            {'last_name' : MyServicesApp.sharedPreferences.getString('last_name')},
            {'email' : MyServicesApp.sharedPreferences.getString('email')},
            {'mobile' : MyServicesApp.sharedPreferences.getString('mobile')},
            {'branch_code' : MyServicesApp.sharedPreferences.getString('branch_code')},
            {'user_type' : MyServicesApp.sharedPreferences.getString('user_type')},
          ]);
          setState(() {
            firstName.clear();
            lastName.clear();
            email.clear();
            mobile.clear();
            userPass.clear();
          });
        } else {
          showErrorSnack(context, "Mobile Number Already Taken");
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
    return Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "يرجي ادخال المعلومات الاتيه ",
              style: TextStyle(
                  fontFamily: 'ArabicUIDisplay',
                  color: green,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            InfoRow(
              fontsize: 15,
              fontfamily: 'ArabicUIDisplayBold',
              icon: Icons.error,
              text: 'الاسم الاول ',
            ),
            //todo: upload to server
            CustomTextField(
              height: 35,
              secure: false,
              controller: firstName,
            ),
            const SizedBox(
              height: 10,
            ),
            InfoRow(
              fontsize: 15,
              fontfamily: 'ArabicUIDisplayBold',
              icon: Icons.error,
              text: 'اسم العائله ',
            ),
            //todo: upload to server
            CustomTextField(
              height: 35,
              secure: false,
              controller: lastName,
            ),
            const SizedBox(
              height: 10,
            ),
            InfoRow(
                fontsize: 15,
                fontfamily: 'ArabicUIDisplayBold',
                icon: Icons.error,
                text: 'رقم الهاتف المحمول '),
            //todo: upload to server
            CustomPhoneTextField(
              controller: mobile,
            ),
            const SizedBox(
              height: 10,
            ),
            InfoRow(
                fontsize: 15,
                fontfamily: 'ArabicUIDisplayBold',
                icon: Icons.error,
                text: 'البريد الالكتروني '),
            //todo: upload to server
            CustomTextField(
              controller: email,
              height: 35,
              secure: false,
            ),
            const SizedBox(
              height: 10,
            ),
            InfoRow(
                fontsize: 15,
                fontfamily: 'ArabicUIDisplayBold',
                icon: Icons.error,
                text: 'كلمة السر '),
            //todo: upload to server
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
              controller: userPass,
            ),
            InfoRow(
                fontsize: 15,
                fontfamily: 'ArabicUIDisplayBold',
                icon: Icons.error,
                text: 'تأكيد كلمة السر '),
            //todo: upload to server
            CustomTextField(
              height: 35,
              secure: secure2,
              perfix: secure2
                  ? IconButton(
                      icon: const Icon(
                        Icons.visibility_off,
                        color: green,
                      ),
                      onPressed: () {
                        setState(() {
                          secure2 = !secure2;
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
                          secure2 = !secure2;
                        });
                      },
                    ),
              controller: userPass2,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10, top: 20),
                  child: Icon(
                    Icons.error,
                    color: darkGreen,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, top: 20),
                  child: Text(
                    " هل انت صاحب متجر ؟",
                    style: TextStyle(
                        fontSize: 17,
                        color: darkGreen,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomChooseContainer(),
            // const CustomCheckBox(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                if (firstName.text == '') {
                  showErrorSnack(context, 'من فضلك لا تترك الاسم الاول فارغا ');
                } if (lastName.text == '') {
                  showErrorSnack(context, 'من فضلك لا تترك اسم العائلة فارغا ');
                }if (mobile.text == '') {
                  showErrorSnack(context, 'من فضلك لا تترك رقم الهاتف المحمول فارغا ');
                }if (email.text == '') {
                  showErrorSnack(context, 'من فضلك لا تترك البريد الالكتروني فارغا ');
                }if (userPass.text == '') {
                  showErrorSnack(context, 'من فضلك ادخل كلمة السر ');
                }if (userPass2.text == '') {
                  showErrorSnack(context, 'من فضلك أكد كلمة السر ');
                }if (userPass.text != userPass2.text) {
                  showErrorSnack(context, "كلمات السر غير مطابقة");
                }else {
                  validateUserEmail();
                }
              },
              child: Center(
                child: CustomNext(
                  width: .75 * MediaQuery.sizeOf(context).width,
                  text: 'التالي',
                ),
              ),
            )
          ],
        )); //body of tab 2
  }
}
