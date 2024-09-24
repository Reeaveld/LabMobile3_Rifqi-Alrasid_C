import 'package:flutter/material.dart';
import 'story_list_page.dart';
import 'sidemenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontFamily: 'UnifrakturMaguntia',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol Gothic Horror (tetap ada)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Gothic red button
              ),
              child: const Text(
                'Dark Fantasy Stories',
                style: TextStyle(
                  fontFamily: 'UnifrakturMaguntia',
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryListPage(category: 'Dark Fantasy'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            // Tombol Dark Fantasy (Dihapus karena tidak dibutuhkan lagi)
            /*
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Gothic red button
              ),
              child: const Text(
                'Dark Fantasy Stories',
                style: TextStyle(
                  fontFamily: 'UnifrakturMaguntia',
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryListPage(category: 'Dark Fantasy'),
                  ),
                );
              },
            ),
            */
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
