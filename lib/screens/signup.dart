import 'package:flutter/material.dart';
import 'package:niner_security/screens/login.dart';
import 'package:niner_security/widgets/custom_text_field.dart';
import 'package:niner_security/widgets/signup_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niner_security/widgets/show_alert.dart';

import '../db/address.dart';
import '../widgets/copyright.dart';
import '../widgets/niner_text.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  //Controllers for Database
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final nameController = TextEditingController();

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

              //Sign Up Text
              const SizedBox(height: 5),
              Text(
                'Sign Up',
                style: GoogleFonts.bebasNeue(
                    textStyle:
                    const TextStyle(color: Colors.black, fontSize: 35)),
              ),

              //Name Field
              const SizedBox(height: 10),
              LoginTextField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false,
              ),

              //Username Field

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
                hintText: 'Enter Password',
                obscureText: true,
              ),

              // Password Confirm Field
              const SizedBox(height: 10),
              LoginTextField(
                controller: passwordConfirmController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              //Already Have an Account
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // Adjust alignment
                  children: [
                    const Text(
                      'Already Have an Account?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Sign Up screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xFF00703C),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              //Sign In Button
              //DO SIGN IN LOGIC
              const SizedBox(height: 15),
              CreateAccount(
                onTap: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  final passwordConfirm = passwordConfirmController.text.trim();
                  final name = nameController.text.trim();
                  final username;
                  final isAdmin = false;
                  int atSymbolIndex;


                  if (email.isEmpty || password.isEmpty || name.isEmpty) {
                    errorNotifier.value = "Email, Password, or Name Cannot Be Empty";
                  } else if (password != passwordConfirm) {
                    errorNotifier.value = "Passwords Do Not Match";
                  } else if (!email.endsWith('@uncc.edu') &&
                      !email.endsWith('@charlotte.edu')) {
                    errorNotifier.value = "Please Enter Your School Email Address";
                  } else {
                    if (password.length < 8 || password.length > 72) {
                      errorNotifier.value = "Password Must Be Between 8 and 72 Characters Long";
                      return;
                    }

                    //Put username field as the beginning of their email
                    atSymbolIndex = email.indexOf('@');
                    username = email.substring(0, atSymbolIndex);


                    final body = <String, dynamic>{
                      "username": username,
                      "email": email,
                      "password": password,
                      "passwordConfirm": passwordConfirm,
                      "name": name,
                      "isAdmin": isAdmin,
                      "emailVisibility" : true,
                    };

                    try {
                      await pb.collection('users').create(body: body);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    } catch (e) {
                      errorNotifier.value = "Sign Up Failed!";
                    }
                  }
                },
              ),

              const SizedBox(height: 10,),
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
}