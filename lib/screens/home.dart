import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login.dart';
import 'package:niner_security/widgets/copyright.dart';


// Initialize Secure Storage
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pb = PocketBase('http://10.0.2.2:8090');
  String userName = '';

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
            userName = user.data['name'] ?? 'Unknown User';
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
      //Clear Authtoken
      pb.authStore.clear();
      await secureStorage.delete(key: 'auth_token');

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

              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF00703C),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 10.0,
                      offset: const Offset(0,0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome $userName!",
                      style: GoogleFonts.bebasNeue(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _logout();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 5,
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 175,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                ),
                child: Row(
                  children: [
                    Text('Emergency Services',
                      style: GoogleFonts.bebasNeue(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 175,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFFE1B12C),
                ),
                child: Row(
                  children: [
                    Text('Lost and Found',
                      style: GoogleFonts.bebasNeue(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 175,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF64B5F6),
                ),
                child: Row(
                  children: [
                    Text('Additional Resources',
                      style: GoogleFonts.bebasNeue(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Copyright(),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
