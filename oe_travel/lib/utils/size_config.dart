import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late double width;
  static late double height;

  init(BoxConstraints constraints) {
    width = constraints.maxWidth / 100;
    height = constraints.maxHeight / 100;
  }
}
