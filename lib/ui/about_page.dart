import 'package:flutter/material.dart';
import 'package:appmodul3/ui/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'About Page',
          style: TextStyle(
            fontFamily: 'UnifrakturMaguntia',
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'This is the About Page',
          style: TextStyle(
            fontFamily: 'UnifrakturMaguntia',
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
