import 'package:flutter/cupertino.dart';

class AppConfig {

  static double trueScreenHeight(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    double topPadding = MediaQuery.of(context).viewPadding.top;
    return MediaQuery.of(context).size.height - topPadding - bottomPadding;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}