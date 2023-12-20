import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/strings.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/bills/bill_details.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/order_details.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/orders/orders_pending.dart';
import 'package:libya_bakery/presentation/screens/auth/login/admin_login.dart';
import 'package:libya_bakery/presentation/screens/auth/login/sign_in_body.dart';
import 'package:libya_bakery/presentation/screens/auth/otp/otp.dart';
import 'package:libya_bakery/presentation/screens/branch.dart';
import 'package:libya_bakery/presentation/screens/client/change_pass.dart';
import 'package:libya_bakery/presentation/screens/client/forget_pass.dart';
import 'package:libya_bakery/presentation/screens/client/personal_info.dart';
import 'package:libya_bakery/presentation/screens/client/profil.dart';
import 'package:libya_bakery/presentation/screens/settings/problems.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';
import 'package:libya_bakery/presentation/screens/on_boarding.dart';
import 'package:libya_bakery/presentation/screens/splash.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const SignInBody());
      case adminLogin:
        return MaterialPageRoute(builder: (_) => const AdminLoginScreen());
      case branch:
        return MaterialPageRoute(builder: (_) => const BranchScreen());
      case menu:
        return MaterialPageRoute(builder: (_) => MenuScreen());
      case otp:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
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
      case billDetails:
        return MaterialPageRoute(builder: (_) => BillDetails());
    }
    return null;
  }
}
