import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appmodul3/ui/home_page.dart';
import 'package:appmodul3/ui/about_page.dart';
import 'package:appmodul3/ui/login_page.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  // Method to clear the username from local storage and navigate to LoginPage
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all data stored in SharedPreferences
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()), // Navigate to LoginPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              'Sidemenu',
              style: TextStyle(
                fontFamily: 'UnifrakturMaguntia', // Gothic-style font
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black87, // Dark header background
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text(
              'Home',
              style: TextStyle(
                fontFamily: 'UnifrakturMaguntia',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.white),
            title: const Text(
              'About',
              style: TextStyle(
                fontFamily: 'UnifrakturMaguntia',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey, // Gothic-style divider
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent), // Red accent for Logout icon
            title: const Text(
              'Logout',
              style: TextStyle(
                fontFamily: 'UnifrakturMaguntia', // Gothic-style font
                color: Colors.redAccent, // Red accent for Logout text
              ),
            ),
            onTap: () {
              _logout(context); // Trigger the logout function
            },
          ),
        ],
      ),
      backgroundColor: Colors.black87, // Dark background for the sidemenu
    );
  }
}
