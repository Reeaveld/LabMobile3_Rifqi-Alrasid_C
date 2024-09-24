import 'package:flutter/material.dart';
import 'story_reader_page.dart';

class StoryListPage extends StatelessWidget {
  final String category;
  
  // Constructor without 'const'
  StoryListPage({super.key, required this.category});

  // Update storyMap without Dark Fantasy category
  final Map<String, List<String>> storyMap = {
    'Dark Fantasy': [
      'The Haunted Castle',
      'Midnight Shadows',
      'The Forgotten Tomb',
      'The Black Knight',       
      'The Sorcerer\'s Curse',   
      'The Fallen Kingdom'       
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<String>? stories = storyMap[category];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$category Stories',
          style: const TextStyle(
            fontFamily: 'UnifrakturMaguntia',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black87,
      body: ListView.builder(
        itemCount: stories?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              stories![index],
              style: const TextStyle(
                fontFamily: 'UnifrakturMaguntia',
                color: Colors.white70,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryReaderPage(storyTitle: stories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
