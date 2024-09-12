import 'package:flutter/material.dart';
import 'package:niner_security/widgets/login_text_field.dart';
import 'package:niner_security/widgets/signin_button.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('http://127.0.0.1:8090');

class Login extends StatelessWidget {
  Login({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SigninButton(
                onTap: () async {
                  try {
                    final authData = await pb
                        .collection('users')
                        .authWithPassword(
                            'YOUR_USERNAME_OR_EMAIL', '1234567890');

                    // Access the authentication data
                    print(pb.authStore.isValid);
                    print(pb.authStore.token);
                    print(pb.authStore.model.id);
                  } catch (e) {
                    // Handle any errors
                    print('Error: $e');
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
