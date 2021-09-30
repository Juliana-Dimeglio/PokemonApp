import 'package:flutter/material.dart';
import '../../core/util/numeric_constants.dart';
import '../../core/util/string_constants.dart';

class SplashTitleAnimation extends StatefulWidget {
  const SplashTitleAnimation({Key? key}) : super(key: key);

  @override
  _SplashTitleAnimationState createState() => _SplashTitleAnimationState();
}

class _SplashTitleAnimationState extends State<SplashTitleAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: NumericConstants.tweenBegin,
        end: NumericConstants.tweenEnd,
      ),
      duration: const Duration(
        seconds: NumericConstants.splashTitleDuration,
      ),
      builder: (BuildContext context, double size, Widget? child) {
        return Text(
          StringConstants.splashScreenText,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
