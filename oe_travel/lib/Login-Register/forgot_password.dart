import 'package:flutter/material.dart';
import 'package:oe_travel/Login-Register/signup.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forgot Password",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(

              Icons.arrow_back_ios,

              color: Color.fromARGB(255, 121, 119, 119),
            ),
            
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.5, 10, 0.0, 0.0),
                      child: const Text(
                        "Forgot ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 55,
                          fontFamily: "Roboto",
                          color: Color.fromARGB(255, 121, 119, 119),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 70, 0.0, 0.0),
                      child: const Text(
                        "Password ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Roboto",
                          color: Color.fromARGB(255, 121, 119, 119),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(260, 53, 0.0, 0.0),
                      child: const Text(
                        ".",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: "Roboto",
                          color: Color.fromRGBO(0, 179, 134, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 150, 0.0, 0.0),
                      child: const Text(
                        "Please enter your email address below and we will send you a link to reset your password.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SanFrancisco",
                          color: Color.fromARGB(255, 118, 119, 119),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 250, 15, 0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Color.fromARGB(255, 196, 191, 191),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 41, vertical: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(28),
                                ),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 196, 191, 191),
                                  width: 1,
                                ),
                                gapPadding: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(28),
                                ),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 196, 191, 191),
                                  width: 1,
                                ),
                                gapPadding: 10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: double.infinity,
                            child: RaisedButton(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              color: const Color.fromARGB(255, 0, 179, 134),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(28),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account yet?  ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Segoe UI",
                                      color: Color.fromARGB(255, 168, 166, 166),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: const Text(
                                      "Create New",
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 0, 179, 134),
                                      ),
                                    ),

                                    //When user click on Create New It will navigate to SignUp Page
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
