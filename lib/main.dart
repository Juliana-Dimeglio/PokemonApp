import 'package:flutter/material.dart';
import 'src/core/util/string_constants.dart';

import 'src/config/route/app_routes.dart';
import 'src/core/util/route_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.mainTitle,
      theme: ThemeData.dark(),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteConstants.splashRoute,
    );
  }
}
