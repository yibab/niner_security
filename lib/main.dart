import 'package:flutter/material.dart';
import 'package:niner_security/screens/home.dart';
import 'package:niner_security/screens/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pocketbase/pocketbase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pb = PocketBase('http://10.0.2.2:8090');
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  // Method to check if the user is authenticated by reading the token from secure storage
  Future<void> checkAuthentication() async {
    final token = await secureStorage.read(key: 'auth_token');
    if (token != null) {
      // Set the token in authStore
      pb.authStore.save(token, null);

      // Check if the token is still valid
      if (pb.authStore.isValid) {
        setState(() {
          isAuthenticated = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isAuthenticated ? const Home() : const Login(),
    );
  }
}
