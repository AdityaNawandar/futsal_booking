import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static var screenSize =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
  static var screenHeight = screenSize.height;
  static var screenWidth = screenSize.width;
}
