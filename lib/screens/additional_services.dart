import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/niner_text.dart';
import '../widgets/copyright.dart';

class AdditionalServices extends StatelessWidget {
  const AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCFFDD),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF00703C),
                Color(0xFF005F2C),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        title: const NinerText(),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    _additonalServicesWidget(
                      title: "Non-Emergency Contact",
                      contact: "704-687-8300",
                    ),
                    const SizedBox(height: 30),
                    _additonalServicesWidget(
                      title: "Emergency Management",
                      contact: "704-687-7884",
                    ),
                    const SizedBox(height: 30),
                    _additonalServicesWidget(
                      title: "Environmental Health & Safety",
                      contact: "704-687-1111",
                    ),
                    const SizedBox(height: 30),
                    _additonalServicesWidget(
                      title: "Facilities Management Line",
                      contact: "704-687-0562",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Copyright(),
        ],
      ),
    );
  }

  //To format each of the additional services the same way
  Widget _additonalServicesWidget({required String title, required String contact}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.bebasNeue(
              fontSize: 26,
              color: Color(0xFF00703C),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                contact,
                style: const TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.call, color: Color(0xFF00703C)),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
