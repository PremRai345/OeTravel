import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              height: 30,
            ),
            //Password
            TextFormField(
              obscureText: true,
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
                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
