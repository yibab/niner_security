import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFF00703C),
      child: const Center(
        child: Text(
          '© 2024 University of North Carolina at Charlotte. All rights reserved.',
          style: TextStyle(
            color: Colors.white, // Text color
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
