import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oe_travel/home/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

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
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Roboto",
                          color: Color.fromARGB(255, 121, 119, 119),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(52.0, 62.0, 0.0, 0.0),
                      child: const Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "SanFrancisco",
                          color: Color.fromARGB(255, 118, 119, 119),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(205, 35.0, 0.0, 0.0),
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
                height: 25,
              ),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            //Login Email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
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
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
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
              height: 30,
            ),
            //Password
            TextFormField(
              obscureText: true,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Confirm Password';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: " Confirm Password",
                hintText: "Re-enter your Password",
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
                //Sign Up wit email and password

                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final emailAddress = emailController.text;
                    final passwordUser = passwordController.text;

                    final user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailAddress,
                      password: passwordUser,
                    );
                    print(user.user!.email);
                  }
                },
                child: const Text(
                  "Sign Up",
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
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    indent: 15,
                    endIndent: 12,
                  ),
                ),
                Text(
                  "OR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Segoe UI",
                    color: Color.fromARGB(255, 168, 166, 166),
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 12,
                    endIndent: 15,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            //Add Social media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  child: const Image(
                    image: AssetImage(
                      "assets/images/facebook.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 40,
                  height: 40,
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
                  child: const Image(
                    image: AssetImage(
                      "assets/images/google.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: 50,
                    height: 45,
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
                    child: const Image(
                      image: AssetImage(
                        "assets/images/twitter.png",
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //Already have an account?
          ],
        ),
      ),
    );
  }
}
