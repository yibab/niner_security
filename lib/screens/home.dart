import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:niner_security/screens/make_report.dart';
import 'package:niner_security/screens/reports.dart';
import 'package:niner_security/widgets/footer.dart';
import 'package:niner_security/widgets/logout_button.dart';
import 'package:niner_security/widgets/niner_text.dart';

import '../core/utils.dart';

// Initialize Secure Storage
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class Home extends StatelessWidget {
  const Home({super.key});

  // String name = pb.authStore.model.data['name'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              const Spacer(),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF00703C),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MakeReport(reportType: 'general')),
                    );
                  },
                  icon: const Icon(Icons.add_circle),
                  label: const Text('Make a General Report', style: TextStyle(fontSize: 20),),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF00703C),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MakeReport(reportType: 'lost item')),
                    );
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('Report a Missing Item', style: TextStyle(fontSize: 20),),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF00703C),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MakeReport(reportType: 'car incident')),
                    );
                  },
                  icon: const Icon(Icons.car_crash_outlined),
                  label: const Text('Report Car Related Incident', style: TextStyle(fontSize: 20),),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    () => urlLaunch('tel:704237-7075');
                  },
                  icon: const Icon(Icons.local_police_outlined),
                  label: const Text('Campus Police Emergency Number', style: TextStyle(fontSize: 20),),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Copyright(),
            ],
          ),
        ),
      ),
    );
  }
}
