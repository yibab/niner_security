import 'package:flutter/material.dart';
import 'package:niner_security/screens/alerts.dart';
import 'package:niner_security/screens/login.dart';
import 'package:niner_security/screens/lost_and_found.dart';
import 'package:niner_security/screens/reports.dart';
import '../db/address.dart';
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Reports(),
        ),
      );
    }
    else if (index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LostReports(),
        ),
      );
    }
    else if (index == 3){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Alerts(),
        ),
      );
    }
    else if (index == 4) {
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
          icon: Icon(Icons.report_sharp),
          label: 'My Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_mark_outlined),
          label: 'Lost & Found',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.crisis_alert),
          label: 'Niner Alerts',
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
