import 'package:flutter/material.dart';

import '../utils/size_config.dart';

var basePadding = EdgeInsets.symmetric(
  vertical: SizeConfig.height,
  horizontal: SizeConfig.width * 4,
);

class ImageConstants {
  static const imageDestinationUrl =
      "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
}

class UserConstants {
  static const userCollection = "user";
  static const userId = "uuid";
}

class DestinationConstant {
  static const destinationCollection = "destination";
  static const destinationId = "id";
}
