import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/controller/complains/read_complain_controller.dart';
import 'package:libya_bakery/core/helper/snack.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/handling_data/handlng_data_view.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/widgets/text_field.dart';

class ComplaintsScreen extends StatelessWidget {
  ComplaintsScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(ReadComplainController());
    return Scaffold(
      backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      body: GetBuilder<ReadComplainController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: Stack(children: [
                const BackGroundImage(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: .20 * MediaQuery.sizeOf(context).height,
                        decoration: const BoxDecoration(
                            color: darkGreen,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: .1 * MediaQuery.sizeOf(context).height,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: .01 * MediaQuery.sizeOf(context).width,
                                ),
                                const Person(),
                  
                                SizedBox(
                                  width: .12 * MediaQuery.sizeOf(context).width,
                                ),
                                const Text(
                                  "الشكاوي",
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: yellow),
                                ),
                                SizedBox(
                                  width: .15 * MediaQuery.sizeOf(context).width,
                                ),
                                //* go to menu page
                                GestureDetector(
                                    onTap: () {
                                      var scaffoldKey;
                                      scaffoldKey.currentState!.openEndDrawer();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Container(
                                        width: 30,
                                        height: 25,
                                        child: Image.asset(
                                          "assets/images/icon_menu.png",
                                          color: yellow,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: .04 * MediaQuery.sizeOf(context).height,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Column(
                        children: [
                          Text(
                            'تفاصيل (الشكوي - المقترح)',
                            style: TextStyle(
                              fontFamily: "ArabicUIDisplay",
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: darkGreen,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(color: Color(0xff00403E), endIndent: 10, indent: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Container(
                          alignment: Alignment.topRight,
                          child: const Text(
                            "الفرع الذي يتم التعامل معه",
                            style: TextStyle(
                              fontFamily: "ArabicUIDisplayBold",
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          width: 350,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                controller.branchNumber.text
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Container(
                              alignment: Alignment.topRight,
                              child: const Text(
                                "تفاصيل الشكوى / المقترح",
                                style: TextStyle(
                                    fontFamily: "ArabicUIDisplayBold",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: green),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              width: 325,
                              height: 165,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                      controller.branchBody.text
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.changeVisibility();
                        },
                        child: Column(
                          children: [
                            Container(
                              width: .8 * MediaQuery.sizeOf(context).width,
                              height: 45,
                              decoration: const BoxDecoration(
                                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                                color: darkGreen,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                              ),
                              child: Center(
                                child:
                                controller.isShown == true
                                    ? const Text(
                                  "اغلاق",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplay",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color(0xffbfed700),
                                  ),
                                )
                                : const Text(
                                  "تواصل مع العميل",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplay",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color(0xffbfed700),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: controller.isShown,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Container(
                                alignment: Alignment.topRight,
                                child: const Text(
                                  "معلومات العميل",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplayBold",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: green,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                width: 350,
                                height: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            '${controller.complainsModel!.firstName!} ${controller.complainsModel!.lastName!} : الاسم ',
                                          style: const TextStyle(
                                            fontSize: 16
                                          ),
                                        ),
                                        Text(
                                            "${controller.complainsModel!.mobile!} : الهاتف",
                                          style: const TextStyle(
                                              fontSize: 16
                                          ),
                                        ),
                                        const Text(
                                          ": البريد الاكتروني",
                                          style: TextStyle(
                                              fontSize: 16
                                          ),
                                        ),
                                        Text(
                                          "${controller.complainsModel!.email!}",
                                          style: const TextStyle(
                                              fontSize: 16
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Container(
                                alignment: Alignment.topRight,
                                child: const Text(
                                  "ارسل رسالة له",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplayBold",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: green,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              height: 150,
                                controller: controller.msgBody,
                                secure: false,
                                isNumber: false
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                controller.replyToComplain(
                                    controller.complainsModel!.email!,
                                    controller.msgBody.text
                                );
                                showSuccessSnack(context, ".تم الارسال بنجاح");
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: .8 * MediaQuery.sizeOf(context).width,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                                      color: darkGreen,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "ارسل",
                                        style: TextStyle(
                                          fontFamily: "ArabicUIDisplay",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Color(0xffbfed700),
                                        ),
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              width: .8 * MediaQuery.sizeOf(context).width,
                              height: 45,
                              decoration: const BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                                  color: Color(0xffbFED700),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                              child: const Center(
                                child: Text(
                                  "الرجوع إلى القائمة",
                                  style: TextStyle(
                                    fontFamily: "ArabicUIDisplay",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: darkGreen,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ])
          );
        }
      ),
    );
  }
}
