import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libya_bakery/business_logic/categoriesCubit/categories_cubit.dart';
import 'package:libya_bakery/business_logic/sub_categories/sub_categories_cubit.dart';
import 'package:libya_bakery/core/utils/app_routes.dart';

import 'package:libya_bakery/data/services/api.dart';
import 'package:libya_bakery/data/services/categories_services.dart';
import 'package:libya_bakery/data/services/sub_categories.dart';

import 'package:libya_bakery/presentation/screens/admin/control.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CategoriesCubit(CategoryServices()),
      ),
      BlocProvider(
        create: (context) => SubCategoriesCubit(SubCategorieServices()),
      ),
    ],
    child: MyApp(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ControlScreen(),
        // 'OnBoarding': (context) => const OnBoardingScreen(),
      },
      initialRoute: '/',
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
