import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oe_travel/Login-Register/login.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("OeTravel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: -0.6,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(255, 121, 119, 119))),
              const Text(
                "Welcome to OeTravel.Travel with us...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "arial",
                  color: Color.fromARGB(255, 121, 119, 119),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Lottie.asset(
                "assets/animation/travel.json",
                height: 300,
                width: double.infinity,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  "Your travelling partner. We will help in your journey. We will help you to find the best places to visit."
                  "Join and start your journey with us.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(255, 121, 119, 119))),
              const SizedBox(
                height: 45,
              ),
              const Text(" Let's Go",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(255, 121, 119, 119))),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                backgroundColor: Color.fromARGB(248, 5, 190, 144),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
