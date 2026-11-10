import 'package:flutter/material.dart';

import '../helper.dart';
import '../models/album.dart';
import '../models/photo.dart';
import '../widgets/collection_state.dart';

class AlbumPhotosScreen extends StatefulWidget {
  const AlbumPhotosScreen({required this.album, super.key});

  final Album album;

  @override
  State<AlbumPhotosScreen> createState() => _AlbumPhotosScreenState();
}

class _AlbumPhotosScreenState extends State<AlbumPhotosScreen> {
  late final Future<List<Photo>> _photos = fetchPhotos(widget.album.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.album.title)),
      body: FutureBuilder<List<Photo>>(
        future: _photos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const CollectionState(
              message: 'Photos could not be loaded. Check your connection.',
              error: true,
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final photos = snapshot.data!;
          if (photos.isEmpty) {
            return const CollectionState(message: 'No photos in this album.');
          }
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) => _PhotoTile(photo: photos[index]),
          );
        },
      ),
    );
  }
}

class _PhotoTile extends StatelessWidget {
  const _PhotoTile({required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            photo.thumbnailUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const ColoredBox(
              color: Color(0xFFE1E8E7),
              child: Icon(Icons.broken_image_outlined),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              color: Colors.black54,
              child: Text(
                photo.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
