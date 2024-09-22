import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:niner_security/widgets/logout_button.dart';
import 'package:niner_security/widgets/niner_text.dart';


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
                        onPressed: () {}, child: const Text("My messages")),
                    const Expanded(
                        child: TextButton(onPressed: null, child: Text(""))),
                    LogoutButton(context: context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
