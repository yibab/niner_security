import 'package:flutter/material.dart';


class LoginTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const LoginTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Colors.black,
                width: 2
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Color(0xFF00703C),
                width: 2
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}
