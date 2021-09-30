import 'package:flutter/material.dart';
import 'package:pokemon_app/home_page.dart';

import '../../core/util/route_constants.dart';
import '../../core/util/string_constants.dart';
import '../../presentation/view/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(
            title: StringConstants.homePageTitle,
          ),
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
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
