import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/data/services/api.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  Services services = Services();

  sendCode() async {
    String url = verifyCode;
    http.Response response = await http.post(Uri.parse(url),
        body: {"verify_code": _otpPinFieldController.currentState!.text});
    if (response.statusCode == 200) {
      print("sucess");
      var data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        print("second ");
        Navigator.pushNamed(context, branch);
      } else {
        print(data);
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: offwhite,
        key: scaffoldKey,
        endDrawer: const Drawer(
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

                  ///  Otp pin Controller
                  const SizedBox(height: 30),
                  OtpPinField(
                      key: _otpPinFieldController,
                      autoFillEnable: false,

                      ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                      textInputAction: TextInputAction.done,

                      ///in case you want to change the action of keyboard
                      /// to clear the Otp pin Controller
                      onSubmit: (text) {
                        print('Entered pin is $text');

                        /// return the entered pin
                      },
                      onChange: (text) {
                        print('Enter on change pin is $text');

                        /// return the entered pin
                      },
                      onCodeChanged: (code) {
                        print('onCodeChanged  is $code');
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
                        child: const Center(
                          child: Row(
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
                      onTap: () async {
                        await sendCode();
                      },
                      child: CustomNext(text: 'تحقق '))
                ],
              )
            ],
          )
        ]));
  }
}
