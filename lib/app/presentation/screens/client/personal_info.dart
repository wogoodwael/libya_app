import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/core/utils/person.dart';
import 'package:libya_bakery/app/presentation/screens/home/home.dart';
import 'package:libya_bakery/app/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/app/presentation/widgets/info_row.dart';
import 'package:libya_bakery/app/presentation/widgets/phone_row.dart';
import 'package:libya_bakery/app/presentation/widgets/text_field.dart';
import 'package:libya_bakery/app/services/MyServices.dart';
import '../../../controller/update_info_controller.dart';
import '../../../core/helper/snack.dart';
import '../../../core/utils/app_color.dart';
import '../menu.dart';

// ignore: must_be_immutable
class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  String? firstNameSaved = MyServicesApp.sharedPreferences.getString("first_name");
  String? lastNameSaved = MyServicesApp.sharedPreferences.getString("last_name");
  String? emailSaved = MyServicesApp.sharedPreferences.getString("email");
  String? mobileSaved = MyServicesApp.sharedPreferences.getString("mobile");
  UpdateInfoController updateInfoController = Get.put(UpdateInfoController());

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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: .22 * MediaQuery.sizeOf(context).height,
                  decoration: const BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: .08 * MediaQuery.sizeOf(context).height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: .01 * MediaQuery.sizeOf(context).width,
                          ),
                          const AppPerson(),
                          const Icon(
                            Icons.shopping_cart_rounded,
                            size: 40,
                            color: yellow,
                          ),
                          SizedBox(
                            width: .04 * MediaQuery.sizeOf(context).width,
                          ),
                          const Text(
                            " حسابك",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: yellow),
                          ),
                          SizedBox(
                            width: .02 * MediaQuery.sizeOf(context).width,
                          ),
                          //* go to menu page
                          GestureDetector(
                              onTap: () {
                                scaffoldKey.currentState!.openEndDrawer();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SizedBox(
                                  width: 30,
                                  height: 25,
                                  child: Image.asset(
                                    "assets/images/icon_menu.png",
                                    color: yellow,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: yellow,
                              size: 30,
                              weight: 200,
                            ),
                            onPressed: () {
                              Get.off(() => const HomeScreen());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: .04 * MediaQuery.sizeOf(context).height,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: .04 * MediaQuery.sizeOf(context).height,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "معلومات شخصية ",
                    style: TextStyle(
                        fontFamily: 'ArabicUIDisplay',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: green),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(
                  height: .01 * MediaQuery.sizeOf(context).height,
                ),
                const Divider(
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: green,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InfoRow(
                    fontsize: 15,
                    fontfamily: 'ArabicUIDisplayBold',
                    icon: Icons.error,
                    text: 'الاسم الاول ',
                  ),
                ),
                //todo: upload to server
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomTextField(
                    height: 35,
                    secure: false,
                    controller: firstName,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InfoRow(
                    fontsize: 15,
                    fontfamily: 'ArabicUIDisplayBold',
                    icon: Icons.error,
                    text: 'اسم العائله ',
                  ),
                ),
                //todo: upload to server
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomTextField(
                    height: 35,
                    secure: false,
                    controller: lastName,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InfoRow(
                      fontsize: 15,
                      fontfamily: 'ArabicUIDisplayBold',
                      icon: Icons.error,
                      text: 'البريد الالكتروني '),
                ),
                //todo: upload to server
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomTextField(
                    controller: email,
                    height: 35,
                    secure: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InfoRow(
                      fontsize: 15,
                      fontfamily: 'ArabicUIDisplayBold',
                      icon: Icons.error,
                      text: 'رقم الهاتف المحمول '),
                ),
                //todo: upload to server
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomPhoneTextField(
                    controller: mobile,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: (){
                    updateInfoController.updateUserInfo(
                        firstName.text.isEmpty ? firstNameSaved! : firstName.text,
                        lastName.text.isEmpty ? lastNameSaved! : lastName.text,
                        email.text.isEmpty ? emailSaved! : email.text,
                        mobile.text.isEmpty ? mobileSaved! : mobile.text,
                    );
                    Future.delayed(const Duration(seconds: 1));
                    showErrorSnack(context, "تم حفظ البيانات");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomNext(text: 'حفظ'),
                  ),
                )
              ],
            ),
          ),
        ])
    );
  }
}
