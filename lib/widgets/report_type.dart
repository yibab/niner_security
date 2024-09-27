import 'package:flutter/material.dart';
import 'package:niner_security/widgets/custom_text_field.dart';
import 'package:niner_security/widgets/show_alert.dart';

import '../db/address.dart';
import '../screens/home.dart';

class ReportType extends StatefulWidget {
  final String reportType;
  ReportType({super.key, required this.reportType});

  @override
  State<ReportType> createState() => _ReportTypeState();
}

class _ReportTypeState extends State<ReportType> {
  final reportMessageController = TextEditingController();

  String reportType = 'general';


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        LoginTextField(
            controller: reportMessageController,
            hintText: "Enter report here",
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

                    final body = <String, dynamic>{
                      "user": pb.authStore.model.id,
                      "report": reportMessageController.text.trim(),
                      "type": reportType,
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
                  child: const Text("Submit")),
            ],
          ),
        ),
      ],
    );
  }
}
