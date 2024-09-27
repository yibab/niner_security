import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:niner_security/screens/make_report.dart';
import 'package:niner_security/screens/reports.dart';
import 'package:niner_security/widgets/logout_button.dart';
import 'package:niner_security/widgets/niner_text.dart';

import '../core/utils.dart';

// Initialize Secure Storage
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class Home extends StatelessWidget {
  Home({super.key});

  // String name = pb.authStore.model.data['name'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCFFDD),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 7.5),
              const NinerText(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Reports()),
                          );
                        },
                        child: const Text("My reports")),
                    const Expanded(
                        child: TextButton(onPressed: null, child: Text(""))),
                    LogoutButton(context: context)
                  ],
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MakeReport()),
                    );
                  },
                  child: const Text("Make a report")),
              Spacer(),
              OutlinedButton(
                  onPressed: () {
                    () => urlLaunch('tel:704237-7075');
                  },
                  child: Text("Campus Police Emergency Number")),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
