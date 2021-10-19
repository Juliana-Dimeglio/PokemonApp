import 'package:flutter/material.dart';
import '../../../home_page.dart';
import '../../presentation/view/splash_screen.dart';
import '../../core/util/route_constants.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes() {
    return {
      RouteConstants.homeRoute: (context) => HomePage(),
      RouteConstants.splashRoute: (context) => SplashScreen(),
    };
  }
}
