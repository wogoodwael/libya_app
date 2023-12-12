import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/business_logic/categoriesCubit/categories_cubit.dart';
import 'package:libya_bakery/business_logic/sub_categories/sub_categories_cubit.dart';
import 'package:libya_bakery/data/services/api.dart';
import 'package:libya_bakery/data/services/categories_services.dart';
import 'package:libya_bakery/data/services/sub_categories.dart';
import 'package:libya_bakery/presentation/screens/admin/control.dart';
import 'package:libya_bakery/presentation/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'binding/bindings.dart';
import 'core/functions/check_permission.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  await requestPerLocation();
  if (!MyServices.sharedPreferences.containsKey('firstTime')) {
    MyServices.sharedPreferences.setBool('firstTime', true);
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CategoriesCubit(CategoryServices()),
      ),
      BlocProvider(
        create: (context) => SubCategoriesCubit(SubCategorieServices()),
      ),
    ],
    child: const MyApp(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<bool> loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberMe') ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      home: FutureBuilder(
        future: loadRememberMe(),
        builder: (context, snapShot) {
          MyServices.sharedPreferences.getBool('firstTime') ?? true;
          if (kDebugMode) {
            print(MyServices.sharedPreferences.getBool('firstTime').toString());
          }
          if (snapShot.data == false) {
            return const SplashScreen();
          } else {
            return ControlScreen();
          }
        },
      ),
    );
  }
}
