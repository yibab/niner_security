import 'package:flutter/material.dart';
import 'package:niner_security/widgets/footer.dart';
import 'package:niner_security/widgets/niner_text.dart';
import 'package:niner_security/widgets/report_type.dart';

class MakeReport extends StatelessWidget {
  final String reportType;

  const MakeReport({super.key, required this.reportType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const NinerText(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  ReportType(
                    reportType: reportType,
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          const Copyright(),
        ],
      ),
    );
  }
}
