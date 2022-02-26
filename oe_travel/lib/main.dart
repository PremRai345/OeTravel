import 'package:flutter/material.dart';
import 'package:oe_travel/WelcomeScreen/welcome.dart';

void main() {
  runApp(const OeTravel());
}

class OeTravel extends StatelessWidget {
  const OeTravel({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Oe Travel',
      home: WelComeScreen(),
    );
  }
}
