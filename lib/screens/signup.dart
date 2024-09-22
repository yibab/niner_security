import 'dart:math';
import 'package:flutter/material.dart';
import 'package:niner_security/screens/login.dart';
import 'package:niner_security/widgets/login_text_field.dart';
import 'package:niner_security/widgets/create_account.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketbase/pocketbase.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //Controllers for Database
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();

  //DO NOT CHANGE ADDRESS
  final pb = PocketBase('http://10.0.2.2:8090');


  //Alert Dialog Stuff
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
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  //Generate Random Username
  //May Change and Keep Displayed Name as The Name Field
  String randomUserName(){
    var random = Random();
    int randomNumber = random.nextInt(100000);
    return 'user$randomNumber';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xFFCCFFDD),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //App Title
              const SizedBox(height: 7.5),
              Text(
                'Niner Security',
                style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                        color: Color(0xFFAD9651),
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(2.5, 2.5)
                          ),
                          Shadow(
                            color: Color(0xFF00703C),
                            blurRadius: 1,
                            offset: Offset(1, 1)
                          )
                        ],
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 60)),
              ),

              //Sign Up Text
              const SizedBox(height: 5),
              Text(
                'Sign Up',
                style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 35)),
              ),

              //Name Field
              const SizedBox(height: 10),
              LoginTextField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false,
              ),

              //Username Field
              const SizedBox(height: 10),
              LoginTextField(
                controller: usernameController,
                hintText: 'Username (Optional)',
                obscureText: false,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment
                  children: [
                    const Text(
                      'Already Have an Account?',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Sign Up screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const Login()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xFF00703C),
                            fontWeight: FontWeight.bold
                        ),
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
                  final passwordConfirm = passwordConfirmController.text.trim(); // Capture confirm password
                  final name = nameController.text.trim();
                  final username = usernameController.text.trim();


                  //Checks for Email and Password being Empty, Password and Password Confirm not Matching, and If School Email is Entered
                  if (email.isEmpty || password.isEmpty || name.isEmpty) {
                    showAlertDialog(context, "Email, Password, and Name cannot be empty");
                  } else if (password != passwordConfirm) {
                    showAlertDialog(context, "Passwords do not match!");
                  } else if (!email.endsWith('@uncc.edu') && !email.endsWith('@charlotte.edu')){
                    showAlertDialog(context, "Please enter your school email address!");
                  } else {
                    // Generate Username if User doesn't enter username
                    String generatedUsername = username.isEmpty ? randomUserName() : username;

                    // Check Password Length
                    if (password.length < 8 || password.length > 72) {
                      showAlertDialog(context, "Password must be between 8 and 72 characters");
                      return;
                    }

                    // Create User
                    final body = <String, dynamic>{
                      "username": generatedUsername,
                      "email": email,
                      "password": password,
                      "passwordConfirm": passwordConfirm, // Pass confirm password
                      "name": name,
                    };

                    //Error Checks In Case Anything Messes Up
                    try {
                      final record = await pb.collection('users').create(body: body);

                      showAlertDialog(context, "Sign Up successful!");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    } catch (e) {
                      showAlertDialog(context, "Sign Up failed");
                    }

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
