import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oe_travel/home/home_screen.dart';
import 'package:oe_travel/utils/validation_mixin.dart';
import 'package:oe_travel/widgets/general_alert_dialog.dart';
import 'package:oe_travel/widgets/general_text_field.dart';
import 'package:oe_travel/widgets/password_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign  Up',
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
              Container(
                width: 370,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      GeneralTextField(
                        title: "Email",
                        icon: Icons.email_outlined,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onFieldSumitted: (_) {},
                        validate: (value) {
                          if (value!.trim().isEmpty) {
                            return "Please enter your email";
                          }

                          //Validate email address
                          if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(value)) {
                            return "Please enter a valid email";
                          }

                          return null;
                        },
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      PasswordField(
                        title: "Password",
                        isObscure: true,
                        controller: passwordController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validate: (value) =>
                            ValidationMixin().validatePassword(value!),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      PasswordField(
                        title: "Confirm Password",
                        isObscure: true,
                        controller: confirmPasswordController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,

                        // Check password match
                        validate: (value) => ValidationMixin().validatePassword(
                          passwordController.text,
                          isConfirmPassword: true,
                          confirmValue: value!,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
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
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          //OnPressed submit function is called
                          onPressed: () {
                            submit(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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
                          print(user.photoUrl);
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
                              MaterialPageRoute(builder: (_) => HomeScreen()));
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
            ],
          ),
        ),
      ),
    );
  }

// Sign up to firebase when user fill the form and select sign up button
  submit(context) async {
    try {
      if (formKey.currentState!.validate()) {
        final firebaseAuth = FirebaseAuth.instance;
        GeneralAlertDialog().customLoadingDialog(context);
        await firebaseAuth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Navigator.pop(context);
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (ex) {
      Navigator.pop(context);
      var message = "";
      if (ex.code == "email-already-in-use") {
        message = "The email is already registered.";
      } else if (ex.code == "weak-password") {
        message = "The password is too weak";
      }
      await GeneralAlertDialog().customAlertDialog(context, message);
    } catch (ex) {
      Navigator.pop(context);
      await GeneralAlertDialog().customAlertDialog(context, ex.toString());
    }
  }
}
