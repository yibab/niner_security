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

class AdditionalServices extends StatelessWidget {
  AdditionalServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFCCFFDD),
      appBar: AppBar(
        flexibleSpace: Stack(
          children: [
            Container(
              color: const Color(0xFF00703C),
            ),
            Opacity(opacity: .3,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
        title: const NinerText(),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height:20),
            Text(
              "Additional Emergency Services",
              style: GoogleFonts.bebasNeue(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),

            const SizedBox(height: 50),
            const Text(
              "Non-Emergency Contact",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "701-687-8300",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 50),
            const Text(
              "Emergency Management",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "704-687-7884",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 50,),
            const Text(
              "Environmental Health & Safety",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "704-687-1111",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 50,),
            const Text(
              "Facilities Management Line",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            const SizedBox(height: 10),
            const Text(
                "704-687-0562",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            const Copyright(),
          ],
        ),
      ),

    );
  }
}