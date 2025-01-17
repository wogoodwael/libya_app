import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'admin/binding/bindings.dart';
import 'admin/core/functions/check_permission.dart';
import 'admin/data/services/api.dart';
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
