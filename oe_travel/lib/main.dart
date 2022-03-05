import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oe_travel/WelcomeScreen/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Connecting to firebase
  await Firebase.initializeApp();
  runApp(const OeTravel());
}

class OeTravel extends StatelessWidget {
  const OeTravel({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oe Travel',
      home: WelComeScreen(),
    );
  }
}
