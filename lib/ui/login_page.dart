import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Method to save username to local storage
  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  // Method to display input field in login form with Gothic theme
  Widget _showInput(TextEditingController controller, String placeholder, bool isPassword) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(
        fontFamily: 'UnifrakturMaguntia', // Gothic-style font
        color: Colors.white, // Gothic text color
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(
          color: Colors.grey, // Dark placeholder color
          fontFamily: 'UnifrakturMaguntia',
        ),
        filled: true,
        fillColor: Colors.black38, // Dark background for input field
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.redAccent, // Red accent for the border
          ),
        ),
      ),
    );
  }

  // Method to display a dialog in login form
  void _showDialog(String pesan, Widget alamat) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black87, // Dark alert dialog background
          title: Text(
            pesan,
            style: const TextStyle(
              fontFamily: 'UnifrakturMaguntia',
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'UnifrakturMaguntia',
                  color: Colors.redAccent, // Gothic red for button text
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => alamat,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87, // Dark background for the login screen
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'UnifrakturMaguntia', // Gothic-style font
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, 'Masukkan Username', false),
            const SizedBox(height: 20),
            _showInput(_passwordController, 'Masukkan Password', true),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Gothic red button color
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'UnifrakturMaguntia', // Gothic-style font
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  // Save Username
                  _saveUsername();
                  // Show success alert and navigate to HomePage
                  _showDialog('Anda Berhasil Login', const HomePage());
                } else {
                  // Show error alert
                  _showDialog('Username dan Password Salah', const LoginPage());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
