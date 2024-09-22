import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NinerText extends StatelessWidget {
  const NinerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Niner Security',
      style: GoogleFonts.bebasNeue(
          textStyle: const TextStyle(
              color: Color(0xFFAD9651),
              shadows: [
                Shadow(
                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(2.5, 2.5)),
                Shadow(
                    color: Color(0xFF00703C),
                    blurRadius: 1,
                    offset: Offset(1, 1))
              ],
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 60)),
    );
  }
}
