import 'package:flutter/material.dart';


class SigninButton extends StatefulWidget {

  final Function()? onTap;

  const SigninButton({super.key, required this.onTap});

  @override
  State<SigninButton> createState() => _SigninButtonState();
}

class _SigninButtonState extends State<SigninButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: const Color(0xFF00703C),
            borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}