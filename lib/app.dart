import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:niner_security/screens/home.dart';
import 'package:niner_security/screens/login.dart';

import 'db/address.dart';

const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // Method to check if the user is authenticated by reading the token from secure storage
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pb.authStore.isValid ?  Home() :  Login(),
    );
  }
}
