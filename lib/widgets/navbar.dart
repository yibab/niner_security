import 'package:flutter/material.dart';
import 'package:niner_security/screens/login.dart';
import '../db/address.dart'; // Ensure you import the necessary package for pb

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1){

    }
    if (index == 2){

    }
    if (index == 3) {
      signOut(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF00703C),
      unselectedItemColor: Colors.white,
      selectedItemColor: const Color(0xFFAD9651),
      currentIndex: _selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.crisis_alert),
          label: 'Niner Alerts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          label: 'My Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
      onTap: _onItemTapped, // Handle item taps
    );
  }

  signOut(BuildContext context) async {
    pb.authStore.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
