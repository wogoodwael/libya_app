import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/admin/complaints.dart';
import 'package:libya_bakery/presentation/screens/admin/control.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/bills/bills.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/clients/clients.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/orders.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/sub_categories/sub_categories.dart';
import 'package:libya_bakery/presentation/widgets/menu_row.dart';

import '../../controller/branch_controller.dart';
import '../../data/services/api.dart';
import 'admin/complaint.dart';
import 'admin/screens/branch_admin.dart';
import 'auth/login/sign_in.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  signOutUser() async {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'تسجيل خروج',
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟',style: TextStyle(fontFamily: 'ArabicUIDisplayBold',),),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'لا',
              style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
            )),
        TextButton(
            onPressed: () {
              MyServices.sharedPreferences.clear();
              Get.offAll(() => const SignInScreen());
            },
            child: const Text(
              'نعم',
              style: TextStyle(color: Colors.black,fontFamily: 'ArabicUIDisplayBold',),
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Stack(children: [
        Image.asset(
          "assets/images/back.png",
          color: Colors.grey.withOpacity(.2),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "القائمة",
                  style: TextStyle(
                    fontFamily: 'ArabicUIDisplayBold',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 27,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: yellow,
                    weight: 100,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            MenuRow(
              ontap: () {
                Get.off(() => ControlScreen());
              },
              text: 'الصفحة الرئيسية',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Get.off(() => ClientScreen());
                },
              text: 'العملاء',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Get.off(() => BillsScreen());
              },
              text: 'الفواتير',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Get.off(() => SubCategories());
              },
              text: 'المنتجات',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Get.off(() => OrderScreen());
              },
              text: 'الطلبات',
            ),
            const SizedBox(
              height: 20,
            ),
            MenuRow(
              ontap: () {
                Get.off(() => ComplaintPage());
              },
              text: 'الشكاوي',
            ),
            SizedBox(
              height: .35 * MediaQuery.sizeOf(context).height,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 10),
              child: MaterialButton(
                  color: const Color.fromARGB(255, 140, 29, 29),
                  minWidth: 60,
                  child: const Text(
                    "تسجيل الخروج ",
                    style: TextStyle(
                        color: yellow,
                        fontFamily: 'ArabicUIDisplayBold',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    signOutUser();
                  }),
            )
          ],
        ))
      ]),
    );
  }
}
