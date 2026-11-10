import 'package:flutter/material.dart';

import '../helper.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../widgets/collection_state.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({required this.post, super.key});

  final Post post;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late final Future<List<Comment>> _comments = fetchComments(widget.post.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('POST · ${widget.post.id}',
              style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Text(widget.post.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(widget.post.body, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 24),
          Text('COMMENTS', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          FutureBuilder<List<Comment>>(
            future: _comments,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const SizedBox(
                  height: 180,
                  child: CollectionState(
                    message: 'Comments could not be loaded. Check your connection.',
                    error: true,
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final comments = snapshot.data!;
              if (comments.isEmpty) {
                return const Text('No comments for this post.');
              }
              return Column(
                children: [
                  for (final comment in comments)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(comment.name,
                                style: Theme.of(context).textTheme.titleSmall),
                            const SizedBox(height: 4),
                            Text(comment.email,
                                style: Theme.of(context).textTheme.labelSmall),
                            const SizedBox(height: 8),
                            Text(comment.body),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
