import 'package:flutter/material.dart';
import '../../core/util/numeric_constants.dart';
import '../../core/util/string_constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: NumericConstants.loaderImageSize,
            child: Image.asset(
              StringConstants.loaderImage,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            StringConstants.loaderText,
            style: TextStyle(
              fontSize: NumericConstants.loaderTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
