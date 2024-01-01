import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/admin/core/utils/back_image.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import '../../../../api_connection/api_connection.dart';
import '../../../../core/helper/snack.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../data/services/api.dart';
import '../../../widgets/custom_next.dart';
import '../../admin/control.dart';
import '../../menu.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  verifyCode(String pin) async{
    try{
      var res = await http.post(
          Uri.parse(API.verifyCode),
          body: {
            'verify_code' : pin
          }
      );
      if(res.statusCode == 200){
        var resBodyOfVerifyCode = jsonDecode(res.body);
        if (resBodyOfVerifyCode['status'] == "success") {
          Get.off(() => ControlScreen());
        } else {
          showErrorSnack(context, "Error, Code Not Correct");
          if (kDebugMode) {
            print('Unexpected status code: ${res.statusCode}');
            print('Response body: ${res.body}');
          }
        }
      }
    } catch(e){
      if (kDebugMode) {
        print('verifyCode error: ${e.toString()}');
      }
    }
  }

  resendCode() async{
    try {
      var res = await http.post(
          Uri.parse(API.changeVerifyCode),
          body: {
            'email': MyServices.sharedPreferences.getString('email').toString(),
          }
      );
      if (res.statusCode == 200) {
        var resBodyOfChangeCode = jsonDecode(res.body);
        if (resBodyOfChangeCode['status'] == "success") {
          showSuccessSnack(context, "تم ارسال رمز جديد الي بريدك");
        } else {
          Get.snackbar('Error', 'Network Error.');
          if (kDebugMode) {
            print('Unexpected status code: ${res.statusCode}');
            print('Response body: ${res.body}');
          }
        }
      }
    }catch(e){
      if (kDebugMode) {
        print('Change Verify Code error: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(MyServices.sharedPreferences.getString('email').toString());
    }
    return Scaffold(
        backgroundColor: offwhite,
        key: scaffoldKey,
        endDrawer: Drawer(
          width: 250,
          child: MenuScreen(),
        ),
        body: Stack(children: [
          const BackGroundImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: .28 * MediaQuery.sizeOf(context).width),
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                    color: darkGreen, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Image.asset(
                    "assets/images/veri.png",
                    width: 150,
                  ),
                ),
              ),
              SizedBox(
                height: .05 * MediaQuery.sizeOf(context).height,
              ),
              Column(
                children: [
                  const Center(
                      child: Text(
                    "لقد ارسلنا رمز تاكيد علي حسابك الالكتروني ",
                    style: TextStyle(
                        color: darkGreen,
                        fontSize: 20,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.bold),
                  )),
                  const Center(
                      child: Text(
                    "ادخل الرمز لكي يتم اكمال تسجيل حسابك  ",
                    style: TextStyle(
                        color: darkGreen,
                        fontSize: 20,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(height: 30),
                  OtpPinField(
                      key: _otpPinFieldController,
                      autoFillEnable: false,

                      ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                      textInputAction: TextInputAction.done,

                      ///in case you want to change the action of keyboard
                      /// to clear the Otp pin Controller
                      onSubmit: (text) {
                        if (kDebugMode) {
                          print('Entered pin is $text');
                        }

                        /// return the entered pin
                      },
                      onChange: (text) {
                        if (kDebugMode) {
                          print('Enter on change pin is $text');
                        }

                        /// return the entered pin
                      },
                      onCodeChanged: (code) {
                        if (kDebugMode) {
                          print('onCodeChanged  is $code');
                        }
                      },

                      /// to decorate your Otp_Pin_Field
                      otpPinFieldStyle: const OtpPinFieldStyle(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),

                        /// border color for inactive/unfocused Otp_Pin_Field
                        defaultFieldBorderColor: darkGreen,

                        /// border color for active/focused Otp_Pin_Field
                        activeFieldBorderColor: darkGreen,

                        /// Background Color for inactive/unfocused Otp_Pin_Field
                        defaultFieldBackgroundColor: Colors.white,

                        /// Background Color for active/focused Otp_Pin_Field
                        activeFieldBackgroundColor: Colors.white,

                        /// Background Color for filled field pin box
                        filledFieldBackgroundColor: darkGreen,

                        /// border Color for filled field pin box
                        filledFieldBorderColor: darkGreen,
                      ),
                      maxLength: 5,

                      /// no of pin field
                      showCursor: true,

                      /// bool to show cursor in pin field or not
                      cursorColor: green,

                      /// to choose cursor color

                      middleChild: const Column(
                        children: [
                          SizedBox(height: 30),
                          SizedBox(height: 10),
                        ],
                      ),
                      showCustomKeyboard: false,
                      showDefaultKeyboard: true,
                      cursorWidth: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      otpPinFieldDecoration:
                          OtpPinFieldDecoration.defaultPinBoxDecoration),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 25,
                        decoration: BoxDecoration(
                            color: darkGreen,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: InkWell(
                            onTap: (){
                              resendCode();
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: yellow,
                                  size: 20,
                                ),
                                Text(
                                  "اعادة الارسال ",
                                  style: TextStyle(
                                      color: yellow,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'ArabicUIDisplayBold'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        " لم يتم ارسال الرمز ؟ ",
                        style: TextStyle(
                            color: darkGreen,
                            fontFamily: 'ArabicUIDisplayBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: darkGreen,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        verifyCode(_otpPinFieldController.currentState!.text);
                      },
                      child: CustomNext(text: 'تحقق '))
                ],
              )
            ],
          )
        ]));
  }
}
