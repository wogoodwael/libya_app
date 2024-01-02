import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/admin/core/utils/logo.dart';
import 'package:libya_bakery/admin/presentation/widgets/info_row.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../api_connection/api_connection.dart';
import '../../../../core/functions/check_internet.dart';
import '../../../../core/helper/snack.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../data/services/api.dart';
import '../../../widgets/custom_next.dart';
import '../../../widgets/text_field.dart';
import '../../admin/control.dart';
import '../../client/forget_pass.dart';
import '../otp/otp.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
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
  bool password = true;

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
          MyServices.sharedPreferences
              .setString('id', resBodyOfLogin['data']['user_id'].toString());
          MyServices.sharedPreferences
              .setString('first_name', resBodyOfLogin['data']['first_name']);
          MyServices.sharedPreferences
              .setString('last_name', resBodyOfLogin['data']['last_name']);
          MyServices.sharedPreferences
              .setString('email', resBodyOfLogin['data']['email']);
          MyServices.sharedPreferences
              .setString('mobile', resBodyOfLogin['data']['mobile']);
          MyServices.sharedPreferences.setString(
              'branch_code', resBodyOfLogin['data']['branch_code'].toString());
          MyServices.sharedPreferences.setString(
              'user_type', resBodyOfLogin['data']['user_type'].toString());
          if (resBodyOfLogin['data']['users_approve'] == 1) {
            // // Save "Remember Me" preference
            saveRememberMe(rememberMe);
            Get.offAll(() => ControlScreen());
          } else {
            Get.to(const OtpScreen(), arguments: [
              {'id': MyServices.sharedPreferences.getString('id')},
              {
                'first_name':
                MyServices.sharedPreferences.getString('first_name')
              },
              {
                'last_name': MyServices.sharedPreferences.getString('last_name')
              },
              {'email': MyServices.sharedPreferences.getString('email')},
              {'mobile': MyServices.sharedPreferences.getString('mobile')},
              {
                'branch_code':
                MyServices.sharedPreferences.getString('branch_code')
              },
              {
                'user_type': MyServices.sharedPreferences.getString('user_type')
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
            crossAxisAlignment: CrossAxisAlignment.end,
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
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
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
                padding: const EdgeInsets.only(right: 20, top: 30, bottom: 5),
                child: InfoRow(
                    fontsize: 15,
                    icon: Icons.error,
                    fontfamily: 'ArabicUIDisplayBold',
                    text: 'اسم المستخدم'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CustomTextField(
                  isNumber: false,
                  height: 60,
                  secure: false, controller: email,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                child: InfoRow(
                  fontsize: 15,
                  icon: Icons.error,
                  text: 'كلمة السر ',
                  fontfamily: 'ArabicUIDisplayBold',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CustomTextField(
                  isNumber: false,
                  height: 60,
                  secure: false,
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
                        ), controller: pass,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap:(){
                        Get.to(() => ForgetPassword());
                      },
                      child: Container(
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                            color: darkGreen,
                            borderRadius: BorderRadius.circular(20)),
                        //! go to forget password page
                        child: const Center(
                            child: Text(
                          "نسيت كلمة السر ؟",
                          style: TextStyle(
                              color: yellow, fontWeight: FontWeight.bold),
                        )),
                      ),
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
                        side: const BorderSide(color: Colors.white, width: 2),
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
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: (){
                  login();
                },
                child: Center(
                  child: CustomNext(
                    width: .75 * MediaQuery.sizeOf(context).width,
                    text: 'التالي ',
                  ),
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
