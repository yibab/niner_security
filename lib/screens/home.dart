import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login.dart';

// Initialize Secure Storage
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pb = PocketBase('http://10.0.2.2:8090');
  String username = '';

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    try {
      // Retrieve the stored auth token
      final token = await secureStorage.read(key: 'auth_token');
      print("Token from secure storage: $token");

      if (token != null) {
        pb.authStore.save(token, null);

        await pb.collection('users').authRefresh();

        // Now the user data should be available in the authStore model
        final user = pb.authStore.model;
        print("AuthStore model after refresh: $user");

        if (user != null) {
          setState(() {
            username = user.data['username'] ?? 'Unknown User';
          });
        } else {
          print("User model is null, possibly due to an invalid token.");
        }
      } else {
        print("No token found in secure storage.");
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
  }


  // Logout the user and clear the token
  void _logout() async {
    try {

      pb.authStore.clear();
      await secureStorage.delete(key: 'auth_token'); // Clear the stored token

      // Navigate to the login screen after logout
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  // Alert Dialog
  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCFFDD),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 7.5),
              Text(
                'Niner Security',
                style: GoogleFonts.bebasNeue(
                  textStyle: const TextStyle(
                    color: Color(0xFFAD9651),
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(2.5, 2.5),
                      ),
                      Shadow(
                        color: Color(0xFF00703C),
                        blurRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome, $username',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _logout,
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
