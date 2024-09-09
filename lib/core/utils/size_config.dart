import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static void init(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }

  //dynamic height
  static double height(double percentage) {
    return screenHeight * percentage;
  }

  //dynamic width
  static double width(double percentage) {
    return screenWidth * percentage;
  }
}
