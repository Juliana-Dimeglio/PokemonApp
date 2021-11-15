import 'package:flutter/material.dart';
import '../../core/util/numeric_constants.dart';
import '../../core/util/string_constants.dart';
import '../widget/splash_title_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
