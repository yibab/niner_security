import 'package:flutter/material.dart';
import 'package:niner_security/widgets/custom_text_field.dart';
import 'package:niner_security/widgets/show_alert.dart';
import 'package:niner_security/widgets/signin_button.dart';
import 'package:niner_security/screens/home.dart';
import 'package:niner_security/screens/signup.dart';
import 'package:google_fonts/google_fonts.dart';

import '../db/address.dart';
import '../widgets/copyright.dart';
import '../widgets/niner_text.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> errorNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFCCFFDD),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //App Title
              const SizedBox(height: 7.5),
              const NinerText(),
              //Sign In Text
              const SizedBox(height: 5),
              Text(
                'Sign In',
                style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                        color: Color(0xFF000000), fontSize: 35)),
              ),

              //Email Field
              const SizedBox(height: 10),
              LoginTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              //Password Field
              const SizedBox(height: 10),
              LoginTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              //Sign Up and Forgot Password Row
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Don't Have an Account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF00703C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              SigninButton(onTap: () {
                signIn(emailController, passwordController, context);
              }),
              const SizedBox(height: 10),

              ValueListenableBuilder<String?>(
                valueListenable: errorNotifier,
                builder: (context, errorMessage,child) {
                  if(errorMessage == null)
                    return const SizedBox.shrink();
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                          errorMessage,
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold
                          )
                      )
                  );
                },
              ),

              //Copyright at Bottom of Page
              const SizedBox(height: 10),
              const Spacer(),
              const Copyright(),
            ],
          ),
        ),
      ),
    );
  }

  signIn(dynamic emailController, dynamic passwordController,
      BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Check for empty email and password fields
    if (email.isEmpty || password.isEmpty) {
      errorNotifier.value = "Email and Password cannot be empty.";
      return;
    }
    try {
      // Authenticate user with PocketBase
      await pb.collection('users').authWithPassword(email, password);

      // Navigate to Home screen after successful login\
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } catch (e) {
      errorNotifier.value = "Incorrect Email or Password.";
    }
  }
}

