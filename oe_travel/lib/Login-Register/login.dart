import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oe_travel/Login-Register/forgot_password.dart';
import 'package:oe_travel/Login-Register/signup.dart';
import 'package:oe_travel/home/home_screen.dart';
import 'package:oe_travel/models/firebase_user.dart';
import 'package:oe_travel/providers/user_provider.dart';
import 'package:oe_travel/widgets/general_text_field.dart';
import 'package:oe_travel/widgets/password_field.dart';
import 'package:provider/provider.dart';

import '../constant/constants.dart';
import '../widgets/general_alert_dialog.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(19.0, 15.0, 0.0, 0.0),
                        child: const Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 55,
                            fontFamily: "Roboto",
                            color: Color.fromARGB(255, 121, 119, 119),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(36.0, 70.0, 0.0, 0.0),
                        child: const Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 45,
                            fontFamily: "SanFrancisco",
                            color: Color.fromARGB(255, 118, 119, 119),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(225, 48.0, 0.0, 0.0),
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
                  height: 30,
                ),

                Container(
                  width: 370,
                  child: GeneralTextField(
                    
                    title: "Email",
                    icon: Icons.email_outlined,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSumitted: (_) {
                      // hide keyboard after task completed
                    },
                    validate: (value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter your email";
                      }

                      // To check valid Email
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 370,
                  child: PasswordField(
                    title: "Password",
                    isObscure: true,
                    controller: passwordController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    validate: (value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter your password";
                      }

                      return null;
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      child: GestureDetector(
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 370,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 0, 179, 134),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28),
                          ),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        _submit(context);
                      }),
                ),
                const SizedBox(
                  height: 40,
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
                        image: AssetImage("assets/images/facebook.png"),
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
                      child: GestureDetector(
                        onTap: () async {
                          //call signin method of google sign in
                          final googleSignIn = GoogleSignIn();
                          final user = await googleSignIn.signIn();

                          //To check if user select google aacount or not
                          if (user != null) {
                            // to save user on authentication
                            final authenticatedUser = await user.authentication;

                            // //Add GoogleAuthPrvoder to firebase
                            final authProvider = GoogleAuthProvider.credential(
                              idToken: authenticatedUser.idToken,
                              accessToken: authenticatedUser.accessToken,
                            );

                            await FirebaseAuth.instance
                                .signInWithCredential(authProvider);
                            //Add to firebase and redirect to home screen
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
                          }
                        },
                        child: const Image(
                          image: AssetImage(
                            "assets/images/google.png",
                          ),
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
                        image: AssetImage("assets/images/twitter.png"),
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
        ),
      ),
    );
  }

  void _submit(context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      final firebaseAuth = FirebaseAuth.instance;
      GeneralAlertDialog().customLoadingDialog(context);
      final UserCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      final user = UserCredential.user;
      if (user != null) {
        final firestore = FirebaseFirestore.instance;
        final data = await firestore
            .collection(UserConstants.userCollection)
            .where(UserConstants.userId, isEqualTo: user.uid)
            .get();
        var map = {};

        if (data.docs.isEmpty) {
          map = FirebaseUser(
            displayName: user.displayName,
            email: user.email,
            photoUrl: user.photoURL,
            uuid: user.uid,
          ).toJson();
        } else {
          map = data.docs.first.data();
        }
        Provider.of<UserProvider>(context, listen: false).setUser(map);
      }
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (ex) {
      Navigator.pop(context);

      var message = "";

      if (ex.code == "wrong-password") {
        message = " Wrong Password";
      } else if (ex.code == "user-not-found") {
        message = "User is not registered";
      }
      await GeneralAlertDialog().customAlertDialog(context, message);
    } catch (ex) {
      Navigator.pop(context);
      await GeneralAlertDialog().customAlertDialog(context, ex.toString());
    }
  }
}
