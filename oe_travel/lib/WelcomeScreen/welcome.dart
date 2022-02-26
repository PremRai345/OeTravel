import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'OeTravel',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.network(
                "https://assets5.lottiefiles.com/packages/lf20_dgblucv4.json",
                height: 300,
                width: double.infinity,
              ),
              const Text(
                "Hello Welcome to Oe Travel.Travel With Us We Provide You The Best Travel Experience. We will Become Your Travel Partner And Help You To Travel Safely.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    color: Color.fromARGB(255, 121, 119, 119)),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(" Continue",
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
                onPressed: () {},
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
