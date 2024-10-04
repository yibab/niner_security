import 'package:flutter/material.dart';
import 'package:niner_security/screens/additional_services.dart';
import 'package:niner_security/screens/make_report.dart';
import 'package:niner_security/screens/reports.dart';
import 'package:niner_security/widgets/footer.dart';
import 'package:niner_security/widgets/logout_button.dart';
import 'package:niner_security/widgets/niner_text.dart';

import '../core/utils.dart';

// Initialize Secure Storage

class Home extends StatelessWidget {
  const Home({super.key});

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
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        child: const Text("My reports", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),), style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    ),
                    const Expanded(
                        child: TextButton(onPressed: null, child: Text(""))),
                    LogoutButton(context: context)
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF00703C),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                    ),
                    side: const BorderSide(color: Color(0xFF000000), width: 2)
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
              SizedBox(height: 30),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      side: const BorderSide(color: Color(0xFF000000), width: 2)
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
              SizedBox(height: 30),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB600),
                    foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      side: const BorderSide(color: Color(0xFF000000), width: 2)
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
              SizedBox(height: 30),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple.shade300,
                    foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      side: const BorderSide(color: Color(0xFF000000), width: 2)

                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdditionalServices()),
                    );
                  },
                  icon: const Icon(Icons.warning_amber),
                  label: const Text('Additional Emergency Services', style: TextStyle(fontSize: 20),),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 90,
                width: 350,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFFF5050),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      side: const BorderSide(color: Color(0xFF000000), width: 2)

                  ),
                  onPressed: () {
                        () => urlLaunch('tel:704237-7075');
                  },
                  icon: const Icon(Icons.local_police_outlined),
                  label: const Text('Contact Campus Police', style: TextStyle(fontSize: 20),),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Spacer(),
              const Copyright(),
            ],
          ),
        ),
      ),
    );
  }
}