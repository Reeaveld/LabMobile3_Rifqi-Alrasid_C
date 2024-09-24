import 'package:flutter/material.dart';

class StoryReaderPage extends StatelessWidget {
  final String storyTitle;
  StoryReaderPage({super.key, required this.storyTitle});

  // Example stories
  final Map<String, String> storyContent = {
    'The Haunted Castle': 'Once upon a time in a dark, remote castle... \n\nVivamus ac venenatis quam. Morbi placerat nisl tortor. Proin sit amet sem egestas quam pretium sagittis nec sit amet nunc. Aenean quis turpis semper, cursus nibh non, ultrices augue. Proin maximus augue turpis. Nulla consequat tincidunt dui id viverra. Vivamus dignissim facilisis leo, id ultrices eros volutpat ac.',
    'Midnight Shadows': 'As the clock struck twelve, shadows began to move... \n\nVivamus ac venenatis quam. Morbi placerat nisl tortor. Proin sit amet sem egestas quam pretium sagittis nec sit amet nunc. Aenean quis turpis semper, cursus nibh non, ultrices augue. Proin maximus augue turpis. Nulla consequat tincidunt dui id viverra. Vivamus dignissim facilisis leo, id ultrices eros volutpat ac.',
    'The Forgotten Tomb': 'Deep beneath the ancient ruins lay a tomb forgotten by time... \n\nVivamus ac venenatis quam. Morbi placerat nisl tortor. Proin sit amet sem egestas quam pretium sagittis nec sit amet nunc. Aenean quis turpis semper, cursus nibh non, ultrices augue. Proin maximus augue turpis. Nulla consequat tincidunt dui id viverra. Vivamus dignissim facilisis leo, id ultrices eros volutpat ac.',
    'The Black Knight': 'In the heart of the cursed land rode a knight clad in black... \n\nVivamus ac venenatis quam. Morbi placerat nisl tortor. Proin sit amet sem egestas quam pretium sagittis nec sit amet nunc. Aenean quis turpis semper, cursus nibh non, ultrices augue. Proin maximus augue turpis. Nulla consequat tincidunt dui id viverra. Vivamus dignissim facilisis leo, id ultrices eros volutpat ac.',
    'The Sorcerer\'s Curse': 'A terrible curse was cast by the wicked sorcerer... \n\nVivamus ac venenatis quam. Morbi placerat nisl tortor. Proin sit amet sem egestas quam pretium sagittis nec sit amet nunc. Aenean quis turpis semper, cursus nibh non, ultrices augue. Proin maximus augue turpis. Nulla consequat tincidunt dui id viverra. Vivamus dignissim facilisis leo, id ultrices eros volutpat ac.',
    'The Fallen Kingdom': 'Once a glorious empire, now it lies in ruins... \n\nVivamus ac venenatis quam. Morbi placerat nisl tortor. Proin sit amet sem egestas quam pretium sagittis nec sit amet nunc. Aenean quis turpis semper, cursus nibh non, ultrices augue. Proin maximus augue turpis. Nulla consequat tincidunt dui id viverra. Vivamus dignissim facilisis leo, id ultrices eros volutpat ac.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          storyTitle,
          style: const TextStyle(
            fontFamily: 'UnifrakturMaguntia',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Text(
          storyContent[storyTitle] ?? 'Story not found.',
          style: const TextStyle(
            fontFamily: 'UnifrakturMaguntia',
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
