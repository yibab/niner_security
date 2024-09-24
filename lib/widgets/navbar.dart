import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.teal,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Emergency Services'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.crisis_alert),
            label: 'Niner Alerts'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Lost and Found'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
    );
  }
}