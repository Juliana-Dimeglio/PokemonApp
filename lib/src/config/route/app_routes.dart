import 'package:flutter/material.dart';
import '../../core/util/string_constants.dart';
import '../../../home_page.dart';

import '../../core/util/route_constants.dart';
import '../../presentation/view/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case RouteConstants.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                StringConstants.errorRouteText + '${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
