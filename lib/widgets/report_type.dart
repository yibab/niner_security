
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niner_security/widgets/custom_text_field.dart';
import 'package:niner_security/widgets/show_alert.dart';
import 'package:intl/intl.dart';
import '../db/address.dart';
import '../screens/home.dart';

class ReportType extends StatelessWidget {
  final String reportType;
   ReportType({super.key, required this.reportType});
   final String disposition = "submitted";
   final reportNameController = TextEditingController();
   final reportMessageController = TextEditingController();
   final contactInfoController = TextEditingController();
   final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Text(
          'Make A Report',
          style: GoogleFonts.bebasNeue(
              textStyle: const TextStyle(
                  color: Color(0xFF000000), fontSize: 35)),
        ),
        const SizedBox(height: 15),
        LoginTextField(
          controller: reportNameController,
          hintText: "Enter a name for your report",
          obscureText: false),
        const SizedBox(
          height: 15,
        ),
        LoginTextField(
            controller: reportMessageController,
            hintText: "Enter report description here",
            obscureText: false),
        const SizedBox(height: 15),
        LoginTextField(
            controller: locationController,
            hintText: "Enter the location of your report",
            obscureText: false),
        const SizedBox(height: 15),
        LoginTextField(
          controller: contactInfoController,
          hintText: "Enter additional contact information",
          obscureText: false),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                  onPressed: () async {

                    final nowUtc = DateTime.now().toUtc();
                    final estOffset = Duration(hours: -5);
                    final estTime = nowUtc.add(estOffset);
                    final formattedDate = DateFormat('hh:mm a MM/dd/yyyy').format(estTime);

                    final body = <String, dynamic>{
                      "user": pb.authStore.model.id,
                      "report_name": reportNameController.text.trim(),
                      "datetime": formattedDate,
                      "contact": contactInfoController.text.trim(),
                      "location": locationController.text.trim(),
                      "user_description": reportMessageController.text.trim(),
                      "type": reportType,
                      "admin_description": "",
                      "disposition": disposition
                    };

                    try {
                      await pb.collection('reports').create(body: body);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ShowAlert(
                              message: "Report was successful!");
                        },
                      );
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ShowAlert(message: "Report failed");
                        },
                      );
                    }
                  },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                  child: const Text("Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
