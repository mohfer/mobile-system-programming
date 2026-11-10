import 'package:flutter/material.dart';

import '../widgets/explorer_card.dart';
import 'albums_screen.dart';
import 'posts_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explorer')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
        children: [
          Text('LIBRARY', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 10),
          ExplorerCard(
            title: 'Albums',
            subtitle: 'Browse image collections',
            icon: Icons.photo_library_outlined,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const AlbumsScreen()),
            ),
          ),
          const SizedBox(height: 12),
          ExplorerCard(
            title: 'Posts',
            subtitle: 'Browse stories and comments',
            icon: Icons.article_outlined,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const PostsScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
