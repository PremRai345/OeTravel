import 'package:flutter/material.dart';
import 'package:oe_travel/Login-Register/forgot_password.dart';
import 'package:oe_travel/Login-Register/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
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
                      padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
                      child: const Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Roboto",
                          color: Color.fromARGB(255, 121, 119, 119),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(36.0, 59.0, 0.0, 0.0),
                      child: const Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "SanFrancisco",
                          color: Color.fromARGB(255, 118, 119, 119),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(208, 33.0, 0.0, 0.0),
                      child: const Text(
                        ".",
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: "Segoe UI",
                          color: Color.fromRGBO(0, 179, 134, 1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            //Login Email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.email_outlined,
                    color: Color.fromARGB(255, 196, 191, 191),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 41, vertical: 20),
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
              height: 30,
            ),
            //Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: "Enter your Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 196, 191, 191),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 41, vertical: 20),
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
              height: 12,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Segoe UI",
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 168, 166, 166),
                    ),
                  ),
                  //When user tap on forgot password navigate to forgot password screen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            //Login Button
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
                  "Login",
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
            const Text(
              "OR",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Segoe UI",
                color: Color.fromARGB(255, 168, 166, 166),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            //Add Social media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.facebook,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.man_outlined,
                    size: 30,
                    color: Color.fromARGB(255, 0, 179, 134),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.facebook,
                    size: 30,
                    color: Color.fromARGB(255, 0, 179, 134),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //Already have an account?
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
                              builder: (context) => SignUpScreen()),
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
    );
  }
}
