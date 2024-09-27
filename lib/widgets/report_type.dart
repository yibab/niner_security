import 'package:flutter/material.dart';
import 'package:niner_security/widgets/custom_text_field.dart';
import 'package:niner_security/widgets/show_alert.dart';

import '../db/address.dart';
import '../screens/home.dart';

class ReportType extends StatefulWidget {
  ReportType({super.key});

  @override
  State<ReportType> createState() => _ReportTypeState();
}

class _ReportTypeState extends State<ReportType> {
  final reportMessageController = TextEditingController();

  String reportType = 'general';

  void button1Clicked() {
    setState(() {
      // setstate using for the rerender the screen
      // if we not use than it not show the sceond text
      reportType = 'general';
    });
  }

  void button2Clicked() {
    setState(() {
      // setstate using for the rerender the screen
      // if we not use than it not show the sceond text
      reportType = 'lost item';
    });
  }

  void button3Clicked() {
    setState(() {
      // setstate using for the rerender the screen
      // if we not use than it not show the sceond text
      reportType = 'car incident';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Choose type of report'),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            iconSize: 72,
            icon: const Icon(Icons.report_gmailerrorred),
            onPressed: () {
              button1Clicked();
            },
          ),
          IconButton(
            iconSize: 72,
            icon: const Icon(Icons.search),
            onPressed: () {
              button2Clicked();
            },
          ),
          IconButton(
            iconSize: 72,
            icon: const Icon(Icons.car_crash_outlined),
            onPressed: () {
              button3Clicked();
            },
          ),
        ]),
        Text('type selected: $reportType'),
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
                    // String type = "optionA";
                    // if(reportType == "general"){
                    //   type = "optionA";
                    // }if(reportType == "lost item"){
                    //   type = "optionB";
                    // }if(reportType == "car incident"){
                    //   type = "optionC";
                    // }

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
