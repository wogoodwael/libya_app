import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/admin/presentation/widgets/custom_next.dart';

import '../../../controller/personal_info_controller.dart';
import '../../../core/helper/snack.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/back_image.dart';
import '../../../core/utils/person.dart';
import '../../../handling_data/handlng_data_view.dart';
import '../../widgets/info_row.dart';
import '../../widgets/phone_row.dart';
import '../../widgets/text_field.dart';
import '../menu.dart';

// ignore: must_be_immutable
class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(PersonalInfoController());
    return Scaffold(
        backgroundColor: offwhite,
        key: scaffoldKey,
        endDrawer: Drawer(
          width: 250,
          child: AdminMenuScreen(),
        ),
        body: GetBuilder<PersonalInfoController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Stack(children: [
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
                              FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: .01 * MediaQuery.sizeOf(context).width,
                                    ),
                                    const Person(),
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
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomTextField(
                            isNumber: false,
                            height: 50,
                            secure: false,
                            controller: controller.firstName,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomTextField(
                            isNumber: false,
                            height: 50,
                            secure: false,
                            controller: controller.lastName,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomTextField(
                            isNumber: false,
                            controller: controller.email,
                            height: 50,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomPhoneTextField(
                            controller: controller.mobile,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                              onTap: (){
                                controller.updateUserInfo(
                                  controller.firstName.text,
                                  controller.lastName.text,
                                  controller.email.text,
                                  controller.mobile.text,
                                );
                                showSuccessSnack(context, ".تم الحفظ بنجاح");
                              },
                              child: CustomNext(text: 'حفظ')),
                        )
                      ],
                    ),
                  ),
                ])
            );
          }
        ));
  }
}
