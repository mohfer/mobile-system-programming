import 'package:flutter/material.dart';

import '../helper.dart';
import '../models/post.dart';
import '../widgets/collection_state.dart';
import '../widgets/explorer_card.dart';
import 'post_detail_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late final Future<List<Post>> _posts = fetchPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const CollectionState(
              message: 'Posts could not be loaded. Check your connection.',
              error: true,
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final posts = snapshot.data!;
          if (posts.isEmpty) {
            return const CollectionState(message: 'No posts found.');
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ExplorerCard(
                title: post.title,
                subtitle: 'Post · ${post.id}',
                icon: Icons.article_outlined,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => PostDetailScreen(post: post),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
