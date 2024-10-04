import 'package:flutter/material.dart';
import 'package:niner_security/screens/login.dart';
import '../db/address.dart';

class LogoutButton extends StatelessWidget {
  final BuildContext context;

  const LogoutButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {signOut(context);}, child: const Text("Log Out", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),  style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
    ),
    );
  }
}

 signOut(context) async {
  pb.authStore.clear();
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
}
