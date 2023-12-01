// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:libya_bakery/core/helper/snack.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/data/services/api.dart';
import 'package:libya_bakery/presentation/widgets/check_box.dart';
import 'package:libya_bakery/presentation/widgets/custom_choose.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/presentation/widgets/info_row.dart';
import 'package:libya_bakery/presentation/widgets/phone_row.dart';
import 'package:libya_bakery/presentation/widgets/text_field.dart';
import 'package:http/http.dart' as http;

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool secure = true;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userCreate = TextEditingController();

  Services services = Services();
  validate() async {
    http.Response res = await http
        .post(Uri.parse(validateEmail), body: {'email': email.text.trim()});
    try {
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        if (data['status'] == 'success') {
          showErrorSnack(context, 'email found ');
          Navigator.pushNamed(context, otp);
        } else {
          signUp();
        }
      } else {
        print(res.statusCode);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  signUp() async {
    var res = services.postRequest(url: signUpLink, bodyData: {
      'first_name': firstName.text,
      'last_name': lastName.text,
      'email': email.text,
      'mobile': mobile.text,
      'user_password': userPass.text
    });
    
    print(res.toString());
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
                    " هل انت مسوق ام صاحب متجر ؟",
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
            //*go to market manager page
            const CustomChooseContainer(),

            //todo: upload to server and shared pref

            const CustomCheckBox(),

            const SizedBox(
              height: 20,
            ),
            //!go to verify email page
            GestureDetector(
              onTap: () async {
                if (firstName.text == '' ||
                    lastName.text == '' ||
                    email.text == '' ||
                    mobile.text == '' ||
                    userPass.text == '') {
                  showErrorSnack(context, 'من فضلك لا تترك حقلا فارغا ');
                } else {
                  await validate();
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
