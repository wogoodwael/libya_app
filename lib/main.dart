import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libya_bakery/business_logic/categoriesCubit/categories_cubit.dart';
import 'package:libya_bakery/business_logic/sub_categories/sub_categories_cubit.dart';
import 'package:libya_bakery/core/utils/app_routes.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/data/services/api.dart';
import 'package:libya_bakery/data/services/categories_services.dart';
import 'package:libya_bakery/data/services/sub_categories.dart';
import 'package:libya_bakery/presentation/screens/admin/add_categories.dart';
import 'package:libya_bakery/presentation/screens/admin/add_product.dart';
import 'package:libya_bakery/presentation/screens/admin/bill_details.dart';
import 'package:libya_bakery/presentation/screens/admin/bills.dart';
import 'package:libya_bakery/presentation/screens/admin/clients.dart';
import 'package:libya_bakery/presentation/screens/admin/customer_information.dart';
import 'package:libya_bakery/presentation/screens/admin/edit_categories.dart';
import 'package:libya_bakery/presentation/screens/admin/edit_product.dart';
import 'package:libya_bakery/presentation/screens/admin/order_details.dart';
import 'package:libya_bakery/presentation/screens/admin/orders.dart';
import 'package:libya_bakery/presentation/screens/admin/orders_admin.dart';
import 'package:libya_bakery/presentation/screens/admin/products_categories.dart';

import 'package:libya_bakery/presentation/screens/splash.dart';

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
        '/': (context) => CustomerInformationScreen(),
        // 'OnBoarding': (context) => const OnBoardingScreen(),
      },
      initialRoute: '/',
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
