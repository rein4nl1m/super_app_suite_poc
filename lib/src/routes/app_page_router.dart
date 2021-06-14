import 'package:flutter/material.dart';
import 'package:mpontom_suite_poc/src/routes/app_routes.dart';
import 'package:mpontom_suite_poc/src/ui/auth/login_page.dart';
import 'package:mpontom_suite_poc/src/ui/auth/pre_auth_page.dart';
import 'package:mpontom_suite_poc/src/ui/auth/recover_password_page.dart';
import 'package:mpontom_suite_poc/src/ui/auth/register_page.dart';
import 'package:mpontom_suite_poc/src/ui/home/home_base_page.dart';
import 'package:mpontom_suite_poc/src/ui/pages/splash_screen.dart';
import 'package:shared/shared.dart' show SharedNavigation;

class AppPageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH:
        return MaterialPageRoute<dynamic>(builder: (_) => SplashScreen());
      case Routes.PRE_AUTH:
        return MaterialPageRoute<dynamic>(builder: (_) => PreAuthPage());
      case Routes.REGISTER:
        return SharedNavigation.rightToLeftTransition(page: RegisterPage());
      case Routes.LOGIN:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginPage());
      case Routes.RECOVER_PASSWORD:
        return SharedNavigation.rightToLeftTransition(
          page: RecoverPasswordPage(),
        );
      case Routes.HOME_BASE_PAGE:
        return MaterialPageRoute<dynamic>(builder: (_) => HomeBasePage());
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
