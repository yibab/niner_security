import 'package:flutter/material.dart';
import 'package:niner_security/screens/additional_services.dart';
import 'package:niner_security/screens/make_report.dart';
import 'package:niner_security/screens/reports.dart';
import 'package:niner_security/widgets/footer.dart';
import 'package:niner_security/widgets/logout_button.dart';
import 'package:niner_security/widgets/niner_text.dart';
import 'package:niner_security/widgets/navbar.dart';

import '../core/utils.dart';

// Initialize Secure Storage

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFCCFFDD),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 7.5),
              const NinerText(),
              const SizedBox(height: 15),
              const Navbar(),
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
                          const MakeReport(reportType: 'General')),
                    );
                  },
                  icon: const Icon(Icons.add_circle),
                  label: const Text(
                    'Make a General Report', style: TextStyle(fontSize: 20),),
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
                          const MakeReport(reportType: 'Lost Item')),
                    );
                  },
                  icon: const Icon(Icons.search),
                  label: const Text(
                    'Report a Missing Item', style: TextStyle(fontSize: 20),),
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
                          const MakeReport(reportType: 'Car Incident')),
                    );
                  },
                  icon: const Icon(Icons.car_crash_outlined),
                  label: const Text('Report Car Related Incident',
                    style: TextStyle(fontSize: 20),),
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
                  label: const Text('Additional Emergency Services',
                    style: TextStyle(fontSize: 20),),
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
                  label: const Text(
                    'Contact Campus Police', style: TextStyle(fontSize: 20),),
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