import 'package:flutter/material.dart';
import 'package:niner_security/widgets/niner_text.dart';
import 'package:niner_security/widgets/report_type.dart';

class MakeReport extends StatelessWidget {
  const MakeReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: NinerText(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              ReportType()],
          ),
        ),
      ),
    );
  }
}
