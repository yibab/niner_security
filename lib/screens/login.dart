import 'package:flutter/material.dart';
import 'package:niner_security/widgets/login_text_field.dart';
import 'package:niner_security/widgets/signin_button.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:niner_security/screens/home.dart';

final pb = PocketBase('http://127.0.0.1:8090');

class Login extends StatelessWidget {
  Login({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //TODO add logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                'Sign In',
                style: TextStyle(color: Colors.lightGreen[900]),
              ),
              const SizedBox(height: 25),
              LoginTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              LoginTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Sign Up screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('Forgot Password?'),
                  ],
                ),
              ),

              //FIX SIGN IN FOR USER
              const SizedBox(height: 10),
              SigninButton(
                onTap: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  //Check for email and password emptiness
                  if (email.isEmpty || password.isEmpty){
                    showAlertDialog(context, "Email and Password cannot be empty");
                    return;
                  }

                  //Authenticate User
                    try {
                      final authData = await pb
                          .collection('users')
                          .authWithPassword(email, password);

                      // Successfully authenticated
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    } catch (e) {
                      // Handle authentication error (e.g., invalid credentials)
                      showAlertDialog(context, "Unauthorized User. Please sign-up");
                    }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
