import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/admin/handling_data/handlng_data_view.dart';
import 'package:libya_bakery/app/controller/user_controller.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/presentation/screens/address/address_view.dart';
import 'package:libya_bakery/app/presentation/screens/branch.dart';
import 'package:libya_bakery/app/presentation/screens/client/forget_pass.dart';
import 'package:libya_bakery/app/presentation/screens/client/personal_info.dart';
import 'package:libya_bakery/app/presentation/screens/client/widgets/profile_row.dart';
import 'package:libya_bakery/app/presentation/screens/menu.dart';
import 'package:libya_bakery/app/services/MyServices.dart';
import '../../../../admin/core/utils/app_color.dart';
import '../auth/login/sign_in.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  signOutUser() async {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'تسجيل خروج',
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'هل أنت متأكد أنك تريد تسجيل الخروج؟',
        style: TextStyle(
          fontFamily: 'ArabicUIDisplayBold',
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'لا',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'ArabicUIDisplayBold',
              ),
            )),
        TextButton(
            onPressed: () {
              MyServicesApp.sharedPreferences.clear();
              Get.offAll(() => const SignInScreen());
            },
            child: const Text(
              'نعم',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'ArabicUIDisplayBold',
              ),
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    var userType = int.parse(
        MyServicesApp.sharedPreferences.getString("user_type").toString());
    var userFund = double.tryParse(
        MyServicesApp.sharedPreferences.getString("user_fund").toString());
    return Scaffold(
        backgroundColor: offwhite,
        key: scaffoldKey,
        endDrawer: const Drawer(
          width: 250,
          child: MenuScreen(),
        ),
        body: GetBuilder<UserController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Stack(children: [
                  const BackGroundImage(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: .25 * MediaQuery.sizeOf(context).height,
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
                                  InkWell(
                                    onTap: () {
                                      userController.getData();
                                    },
                                    child: const Icon(
                                      Icons.refresh,
                                      size: 40,
                                      color: yellow,
                                    ),
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
                                      Get.back();
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
                        const Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60,
                            backgroundImage:
                            ExactAssetImage("assets/images/person.png"),
                          ),
                        ),
                        SizedBox(
                          height: .01 * MediaQuery.sizeOf(context).height,
                        ),
                        Center(
                          child: Text(
                            userType == 1
                                ? '${MyServicesApp.sharedPreferences.getString("first_name").toString()} ${MyServicesApp.sharedPreferences.getString("last_name").toString()}'
                                : MyServicesApp.sharedPreferences
                                .getString("first_name")
                                .toString(),
                            style: const TextStyle(
                                fontFamily: 'ArabicUIDisplay',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: darkGreen),
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
                        SizedBox(
                          height: .01 * MediaQuery.sizeOf(context).height,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${userFund!.toStringAsFixed(2)}\t\tد.ل",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userFund > 0 ? Colors.green : Colors.red,
                                fontSize: 20,
                                fontFamily: 'ArabicUIDisplayBold',
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                " رصيدك ",
                                style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: darkGreen),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: .04 * MediaQuery.sizeOf(context).height,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PersonalInfoScreen());
                          },
                          child: const ProfileRow(
                              img: "assets/images/edit.png", txt: 'معلومات شخصية'),
                        ),
                        // SizedBox(
                        //   height: .02 * MediaQuery.sizeOf(context).height,
                        // ),
                        // const ProfileRow(
                        //     img: "assets/images/edit.png", txt: 'معلومات عن المتجر'),
                        SizedBox(
                          height: .02 * MediaQuery.sizeOf(context).height,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ForgetPassword());
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                    left: 40,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: green,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  " تغير كلمة السر ",
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: darkGreen),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: .04 * MediaQuery.sizeOf(context).height,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const AddressView());
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                    left: 40,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: green,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  " العناوين",
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: darkGreen),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: .04 * MediaQuery.sizeOf(context).height,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const BranchScreen());
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                    left: 40,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: green,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  " تغير الفرع  ",
                                  style: TextStyle(
                                      fontFamily: 'ArabicUIDisplayBold',
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: darkGreen),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: .04 * MediaQuery.sizeOf(context).height,
                        ),
                        MaterialButton(
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
                      ],
                    ),
                  ),
                ])
            );
          }
        ));
  }
}
