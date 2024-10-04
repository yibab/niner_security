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
      backgroundColor: const Color(0xFFCCFFDD),
      appBar: AppBar(
        title: const NinerText(),
        flexibleSpace: Stack(
          children: [
            Container(
              color: Color(0xFF00703C)
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
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
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