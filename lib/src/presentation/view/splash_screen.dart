import 'package:flutter/material.dart';

import '../../core/util/numeric_constants.dart';
import '../../core/util/route_constants.dart';
import '../../core/util/string_constants.dart';
import '../widget/splash_title_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
        const Duration(
          milliseconds: NumericConstants.splashScreenGifDuration,
        ), () {
      Navigator.of(context).pushReplacementNamed(
        RouteConstants.homeRoute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              StringConstants.splashScreenBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: NumericConstants.splashScreenGifMargin,
                ),
                child: Image.asset(
                  StringConstants.splashScreenGif,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: NumericConstants.splashScreenPadding,
                ),
                child: SplashTitleAnimation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
