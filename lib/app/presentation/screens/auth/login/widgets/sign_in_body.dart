import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/app/services/MyServices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../admin/core/helper/snack.dart';
import '../../../../../../admin/core/utils/app_color.dart';
import '../../../../../../admin/presentation/screens/auth/login/admin_login.dart';
import '../../../../../../admin/presentation/screens/auth/otp/otp.dart';
import '../../../../../../admin/presentation/widgets/info_row.dart';
import '../../../../../../admin/presentation/widgets/text_field.dart';
import '../../../../../api_connection/api_connection.dart';
import '../../../../../core/functions/check_internet.dart';
import '../../../../widgets/custom_next.dart';
import '../../../client/forget_pass.dart';
import '../../../home/home.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  var res;

  intialData() async {
    res = await checkInternet();
    if (kDebugMode) {
      print('Internet Connected: $res');
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool rememberMe = false;
  bool password = false;

  Future<void> saveRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
  }

  Future<bool> loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberMe') ?? false;
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

  login() async {
    try {
      http.Response response = await http.post(Uri.parse(API.login), body: {
        'user_email': email.text.trim(),
        "password": pass.text.trim(),
      });
      if (response.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(response.body);
        if (resBodyOfLogin["status"] == "success") {
          MyServicesApp.sharedPreferences
              .setString('id', resBodyOfLogin['data']['user_id'].toString());
          MyServicesApp.sharedPreferences
              .setString('first_name', resBodyOfLogin['data']['first_name']);
          MyServicesApp.sharedPreferences
              .setString('last_name', resBodyOfLogin['data']['last_name']);
          MyServicesApp.sharedPreferences
              .setString('email', resBodyOfLogin['data']['email']);
          MyServicesApp.sharedPreferences
              .setString('mobile', resBodyOfLogin['data']['mobile']);
          MyServicesApp.sharedPreferences.setString(
              'branch_code', resBodyOfLogin['data']['branch_code'].toString());
          MyServicesApp.sharedPreferences.setString(
              'user_type', resBodyOfLogin['data']['user_type'].toString());
          MyServicesApp.sharedPreferences.setString(
              'user_fund', resBodyOfLogin['data']['user_fund'].toString());
          if (resBodyOfLogin['data']['users_approve'] == 1) {
            // // Save "Remember Me" preference
            saveRememberMe(rememberMe);
            Get.offAll(() => const HomeScreen());
          } else {
            Get.to(const OtpScreen(), arguments: [
              {'id': MyServicesApp.sharedPreferences.getString('id')},
              {
                'first_name':
                    MyServicesApp.sharedPreferences.getString('first_name')
              },
              {
                'last_name': MyServicesApp.sharedPreferences.getString('last_name')
              },
              {'email': MyServicesApp.sharedPreferences.getString('email')},
              {'mobile': MyServicesApp.sharedPreferences.getString('mobile')},
              {
                'branch_code':
                    MyServicesApp.sharedPreferences.getString('branch_code')
              },
              {
                'user_type': MyServicesApp.sharedPreferences.getString('user_type')
              },
              {
                'user_fund': MyServicesApp.sharedPreferences.getString('user_fund')
              },
            ]);
          }
        } else {
          showErrorSnack(context, "البريد أو كلمة المرور غير صحيحة");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('login error: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 20,
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
        CustomLoginContainer(
          controller: pass,
          pass: true,
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
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap:(){
                  Get.to(() => const ForgetPassword());
                },
                child: Container(
                  width: 110,
                  height: 30,
                  decoration: BoxDecoration(
                      color: darkGreen, borderRadius: BorderRadius.circular(20)),
                  //! go to forget password page
                  child: const Center(
                      child: Text(
                    "نسيت كلمة السر ؟",
                    style: TextStyle(color: yellow, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                width: .3 * MediaQuery.sizeOf(context).width,
              ),
              // const Text(
              //   'تذكرني',
              //   style: TextStyle(
              //       fontFamily: 'ArabicUIDisplayBold',
              //       fontWeight: FontWeight.bold),
              // ),
              // Checkbox(
              //     fillColor: MaterialStateProperty.resolveWith((states) {
              //       if (!states.contains(MaterialState.selected)) {
              //         return Colors.white;
              //       }
              //       return null;
              //     }),
              //     side: const BorderSide(color: Colors.black, width: 2),
              //     activeColor: Colors.white,
              //     checkColor: Colors.blue,
              //     value: rememberMe,
              //     onChanged: (val) {
              //       setState(() {
              //         rememberMe = val!;
              //       });
              //     }),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            login();
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
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "هل انت مسؤل في المخابز ؟",
            style: TextStyle(
                fontFamily: 'ArabicUIDisplayBold',
                color: darkGreen,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Get.to(() => const AdminLoginScreen());
            },
            child: CustomNext(
              width: .75 * MediaQuery.sizeOf(context).width,
              text: 'تسجيل دخول ',
            ),
          ),
        )
      ],
    );
  }
}
