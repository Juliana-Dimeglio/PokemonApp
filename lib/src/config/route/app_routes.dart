import 'package:flutter/material.dart';
import '../../../home_page.dart';
import '../../core/util/route_constants.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes() {
    return {
      RouteConstants.homeRoute: (context) => HomePage(),
    };
  }
}
