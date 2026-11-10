import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/album.dart';
import 'models/comment.dart';
import 'models/photo.dart';
import 'models/post.dart';

Future<List<Album>> fetchAlbums() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: {'Accept': 'application/json'},
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to load albums (${response.statusCode})');
  }

  final albums = jsonDecode(response.body) as List<dynamic>;
  return albums
      .map((album) => Album.fromJson(album as Map<String, dynamic>))
      .toList();
}

Future<List<Photo>> fetchPhotos(int albumId) async {
  final uri = Uri.https(
    'jsonplaceholder.typicode.com',
    '/photos',
    {'albumId': '$albumId'},
  );
  final response = await http.get(
    uri,
    headers: {'Accept': 'application/json'},
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to load photos (${response.statusCode})');
  }

  final photos = jsonDecode(response.body) as List<dynamic>;
  return photos
      .map((photo) => Photo.fromJson(photo as Map<String, dynamic>))
      .toList();
}

Future<List<Post>> fetchPosts() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: {'Accept': 'application/json'},
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to load posts (${response.statusCode})');
  }

  final posts = jsonDecode(response.body) as List<dynamic>;
  return posts
      .map((post) => Post.fromJson(post as Map<String, dynamic>))
      .toList();
}

Future<List<Comment>> fetchComments(int postId) async {
  final uri = Uri.https(
    'jsonplaceholder.typicode.com',
    '/comments',
    {'postId': '$postId'},
  );
  final response = await http.get(
    uri,
    headers: {'Accept': 'application/json'},
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to load comments (${response.statusCode})');
  }

  final comments = jsonDecode(response.body) as List<dynamic>;
  return comments
      .map((comment) => Comment.fromJson(comment as Map<String, dynamic>))
      .toList();
}
