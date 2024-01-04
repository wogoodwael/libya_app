import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/admin/presentation/screens/auth/login/sign_in.dart';
import 'package:libya_bakery/app/controller/user_controller.dart';
import 'package:libya_bakery/app/presentation/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin/binding/bindings.dart';
import 'admin/core/functions/check_permission.dart';
import 'admin/data/services/api.dart';
import 'admin/presentation/screens/admin/control.dart';
import 'admin/presentation/screens/splash.dart';
import 'app/services/MyServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  await initialServiceApp();
  await requestPerLocation();
  if (!MyServices.sharedPreferences.containsKey('firstTime')) {
    MyServices.sharedPreferences.setBool('firstTime', true);
  }
  if (!MyServicesApp.sharedPreferences.containsKey('firstTime')) {
    MyServicesApp.sharedPreferences.setBool('firstTime', true);
  }
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Future<bool> loadRememberMe() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool('rememberMe') ?? false;
  // }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      home: const SplashScreen(),
      // home: GetBuilder<UserController>(
      //   builder: (userController) {
      //     return FutureBuilder(
      //       future: loadRememberMe(),
      //       builder: (context, snapShot) {
      //         MyServices.sharedPreferences.getBool('firstTime') ?? true;
      //         if (kDebugMode) {
      //           print(MyServices.sharedPreferences.getBool('firstTime').toString());
      //         }
      //         if (snapShot.data == false) {
      //           return const SplashScreen();
      //         } else {
      //           if(userController.data[thisUser].user_type == 4){
      //             return ControlScreen();
      //           } else {
      //             return const HomeScreen();
      //           }
      //         }
      //       },
      //     );
      //   }
      // ),
    );
  }
}
