import 'package:flutter/material.dart';

import '../utils/size_config.dart';

var basePadding = EdgeInsets.symmetric(
  vertical: SizeConfig.height,
  horizontal: SizeConfig.width * 4,
);

class UserConstants {
  static const userCollection = "user";
  static const userId = "uuid";
}

class DestinationConstant{
  static const destinationCollection = "destination";
  static const destinationId = "id";
}

