import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/data/services/api.dart';
import 'package:libya_bakery/presentation/screens/admin/control.dart';
import 'package:libya_bakery/presentation/screens/auth/otp/otp.dart';
import 'package:libya_bakery/presentation/screens/branch.dart';
import 'package:libya_bakery/presentation/screens/client/forget_pass.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/presentation/widgets/info_row.dart';
import 'package:libya_bakery/presentation/widgets/text_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/functions/check_internet.dart';
import '../../../../core/helper/snack.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  bool password = true;
  bool rememberMe = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  var res;

  intialData() async {
    res = await checkInternet();
    if (kDebugMode) {
      print('Internet Connected: $res');
    }
  }

  @override
  void initState() {
    super.initState();
    intialData();
    loadRememberMe().then((value) {
      setState(() {
        rememberMe = value;
      });
    });
  }

  Future<void> saveRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
  }

  Future<bool> loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberMe') ?? false;
  }

  login() async {
    http.Response response = await http.post(Uri.parse(loginLink), body: {
      'user_email': email.text.trim(),
      "password": pass.text.trim(),
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data['status'] == 'success') {
        print('sucesss');
        MyServices.sharedPreferences
            .setString('id', data['data']['user_id'].toString());
        MyServices.sharedPreferences
            .setString('first_name', data['data']['first_name']);
        MyServices.sharedPreferences
            .setString('last_name', data['data']['last_name']);
        MyServices.sharedPreferences.setString('email', data['data']['email']);
        MyServices.sharedPreferences
            .setString('mobile', data['data']['mobile']);
        MyServices.sharedPreferences
            .setString('branch_code', data['data']['branch_code'].toString());
        MyServices.sharedPreferences
            .setString('user_type', data['data']['user_type'].toString());
        if (data['data']['users_approve'] == 1) {
          saveRememberMe(rememberMe);
          Get.to(() => ControlScreen());
        } else {
          Get.to(() => const OtpScreen());
        }
      } else {
        showErrorSnack(context, "البريد الالكتروني او كلمة السر غير صحيحة");
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 100,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            "يرجي ادخال المعلومات الاتيه ",
            style: TextStyle(
                fontFamily: 'ArabicUIDisplay',
                color: green,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InfoRow(
              fontsize: 15,
              fontfamily: 'ArabicUIDisplayBold',
              icon: Icons.error,
              text: 'البريد الالكتروني   '),
        ),

        //TOdO: Upload Information of user to server

        CustomLoginContainer(controller: email, pass: false),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InfoRow(
              fontsize: 15,
              fontfamily: 'ArabicUIDisplayBold',
              icon: Icons.error,
              text: 'كلمة السر'),
        ),
        //TOdo: Upload Information of user to server

        CustomLoginContainer(
          controller: pass,
          pass: password,
          perfix: password
              ? IconButton(
                  icon: const Icon(
                    Icons.visibility_off,
                    color: green,
                  ),
                  onPressed: () {
                    setState(() {
                      password = !password;
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
                      password = !password;
                    });
                  },
                ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => ForgetPassword());
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 110,
                  height: 30,
                  decoration: BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    "نسيت كلمة السر ؟",
                    style:
                        TextStyle(color: yellow, fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  width: .3 * MediaQuery.sizeOf(context).width,
                ),
                const Text(
                  'تذكرني',
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplayBold',
                      fontWeight: FontWeight.bold),
                ),
                Checkbox(
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (!states.contains(MaterialState.selected)) {
                        return Colors.white;
                      }
                      return null;
                    }),
                    side: const BorderSide(color: Colors.black, width: 2),
                    activeColor: Colors.white,
                    checkColor: Colors.blue,
                    value: rememberMe,
                    onChanged: (val) {
                      setState(() {
                        rememberMe = val!;
                      });
                    }),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () async {
            await login();
          },
          child: Center(
            child: CustomNext(
              width: .75 * MediaQuery.sizeOf(context).width,
              text: 'التالي ',
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: darkGreen,
          endIndent: 10,
          indent: 10,
          thickness: 3,
        ),
      ],
    );
  }
}
