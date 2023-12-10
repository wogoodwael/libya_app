import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/bills/bill_details.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/order_details.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/orders.dart';
import 'package:libya_bakery/presentation/screens/auth/login/admin_login.dart';
import 'package:libya_bakery/presentation/screens/auth/login/sign_in_body.dart';
import 'package:libya_bakery/presentation/screens/auth/otp/otp.dart';
import 'package:libya_bakery/presentation/screens/branch.dart';
import 'package:libya_bakery/presentation/screens/card/card_order.dart';
import 'package:libya_bakery/presentation/screens/card/confirm_order.dart';
import 'package:libya_bakery/presentation/screens/card/last_page.dart';
import 'package:libya_bakery/presentation/screens/categories/categories.dart';
import 'package:libya_bakery/presentation/screens/categories/sub_category.dart';
import 'package:libya_bakery/presentation/screens/client/change_pass.dart';
import 'package:libya_bakery/presentation/screens/client/forget_pass.dart';
import 'package:libya_bakery/presentation/screens/client/personal_info.dart';
import 'package:libya_bakery/presentation/screens/client/profil.dart';
import 'package:libya_bakery/presentation/screens/settings/problems.dart';
import 'package:libya_bakery/presentation/screens/favorite/favorite.dart';
import 'package:libya_bakery/presentation/screens/home/home.dart';
import 'package:libya_bakery/presentation/screens/auth/login/market_admin_login.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/screens/on_boarding.dart';
import 'package:libya_bakery/presentation/screens/orders/previous_order_details.dart';
import 'package:libya_bakery/presentation/screens/orders/previous_orders.dart';
import 'package:libya_bakery/presentation/screens/auth/signup/sign_up.dart';
import 'package:libya_bakery/presentation/screens/splash.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const SignInBody());

      case marketLogin:
        return MaterialPageRoute(builder: (_) => const MarketLoginScreen());
      case adminLogin:
        return MaterialPageRoute(builder: (_) => const AdminLoginScreen());
      case branch:
        return MaterialPageRoute(builder: (_) => BranchScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case categories:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      case previousOrder:
        return MaterialPageRoute(builder: (_) => PreviousOrdersScreen());
      case favoriteScreen:
        return MaterialPageRoute(builder: (_) => FavoriteScreen());
      case prevOrderDetails:
        return MaterialPageRoute(builder: (_) => PreviousOrderDetails());
      case subCategory:
        return MaterialPageRoute(builder: (_) => SubCategoryScreen());
      case otp:
        return MaterialPageRoute(builder: (_) => OtpScreen());
      case problems:
        return MaterialPageRoute(builder: (_) => const ProblemScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case personalInfo:
        return MaterialPageRoute(builder: (_) => PersonalInfoScreen());
      case forgetPass:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case changePass:
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case cardOrders:
        return MaterialPageRoute(builder: (_) => CardOrders());
      case confirmOrders:
        return MaterialPageRoute(builder: (_) => ConfirmOrders());
      case lastPageOrders:
        return MaterialPageRoute(builder: (_) => LastPage());
      case ordersAdmin:
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case orderDetails:
        return MaterialPageRoute(builder: (_) => OrderDetails());
      case billDetails:
        return MaterialPageRoute(builder: (_) => BillDetails());
    }
    return null;
  }
}
