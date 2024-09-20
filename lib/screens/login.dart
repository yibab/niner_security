import 'package:flutter/material.dart';
import 'package:niner_security/widgets/login_text_field.dart';
import 'package:niner_security/widgets/signin_button.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:niner_security/screens/home.dart';
import 'package:niner_security/screens/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';




//Initialize Storage to Ensure User Auth to Carry Between Screens (Got Rid of Shared Preferences - Stores Only in PlainText)
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class Login extends StatefulWidget {
  const Login({super.key});


  @override
  _LoginState createState() => _LoginState();
}



//Important Stuff For Login.dart
class _LoginState extends State<Login> {
  late final PocketBase pb;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();

  // Alert Dialog to display messages
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

  // Check for saved token and model when the page loads
  @override
  void initState() {
    super.initState();
    _initializePocketBase();
  }


  Future<void> _initializePocketBase() async {
    final token = await secureStorage.read(key: 'auth_token');
    pb = PocketBase('http://10.0.2.2:8090');

    // If there's a token, manually set it in the authStore
    if (token != null) {
      print ("Token: $token");
      pb.authStore.save(token, null); // Save the token, no need to pass model yet

      // Check if the token is still valid
      try {
        // Refresh the authentication to check validity
        await pb.collection('users').authRefresh();

        // If valid, navigate to Home page
        if (pb.authStore.isValid) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        }
      } catch (e) {
        await secureStorage.delete(key: 'auth_token');
        print("Token invalid, needs re-authentication.");
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            //Sign In Text
            const SizedBox(height: 5),
            Text(
              'Sign In',
              style: GoogleFonts.bebasNeue(
                  textStyle: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 35)),

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
                          MaterialPageRoute(builder: (context) => const SignUp()),
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

              //FIX SIGN IN FOR USER
              const SizedBox(height: 10),
              SigninButton(
                  onTap: () async {
                    try {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      // Check for empty email and password fields
                      if (email.isEmpty || password.isEmpty) {
                        showAlertDialog(context, "Email and Password cannot be empty");
                        return;
                      }

                      // Authenticate user with PocketBase
                      final authData = await pb.collection('users').authWithPassword(email, password);

                      // Save the auth token securely
                      await secureStorage.write(key: 'auth_token', value: authData.token);

                      // Navigate to Home screen after successful login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );

                    } catch (e) {
                      print('Error logging in: $e');
                      showAlertDialog(context, "Incorrect Email or Password");
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
