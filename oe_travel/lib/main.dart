import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oe_travel/WelcomeScreen/welcome.dart';
import 'package:oe_travel/utils/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Connecting to firebase4

  await Firebase.initializeApp();

  //To disable the screen rotation;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const OeTravel());
}

class OeTravel extends StatelessWidget {
  const OeTravel({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);

      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oe Travel',
        home: WelComeScreen(),
      );
    });
  }
}
