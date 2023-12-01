import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/presentation/widgets/info_row.dart';
import 'package:libya_bakery/core/utils/logo.dart';
import 'package:libya_bakery/presentation/widgets/text_field.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  bool password = true;
  bool remeberMe = false;
  TextEditingController pass= TextEditingController();
  TextEditingController email= TextEditingController();
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
                child: CustomTextField(height: 35, secure: false, controller: email,),
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
                  height: 35,
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
                    Container(
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
                    SizedBox(
                      width: .3 * MediaQuery.sizeOf(context).width,
                    ),
                    //Todo: Shared pref

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
                        value: remeberMe,
                        onChanged: (val) {
                          setState(() {
                            remeberMe = val!;
                          });
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: CustomNext(
                  width: .75 * MediaQuery.sizeOf(context).width,
                  text: 'التالي ',
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
