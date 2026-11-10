import 'package:flutter/material.dart';

import '../helper.dart';
import '../models/album.dart';
import '../models/photo.dart';
import '../widgets/collection_state.dart';
import '../widgets/explorer_card.dart';
import 'album_photos_screen.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late final Future<List<Album>> _albums = fetchAlbums();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: FutureBuilder<List<Album>>(
        future: _albums,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const CollectionState(
              message: 'Albums could not be loaded. Check your connection.',
              error: true,
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final albums = snapshot.data!;
          if (albums.isEmpty) {
            return const CollectionState(message: 'No albums found.');
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: albums.length,
            itemBuilder: (context, index) => _AlbumCard(album: albums[index]),
          );
        },
      ),
    );
  }
}

class _AlbumCard extends StatefulWidget {
  const _AlbumCard({required this.album});

  final Album album;

  @override
  State<_AlbumCard> createState() => _AlbumCardState();
}

class _AlbumCardState extends State<_AlbumCard> {
  late final Future<List<Photo>> _photos = fetchPhotos(widget.album.id);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: _photos,
      builder: (context, snapshot) {
        final thumbnailUrl = snapshot.data?.firstOrNull?.thumbnailUrl;
        return ExplorerCard(
          title: widget.album.title,
          subtitle: 'Album · ${widget.album.id}',
          icon: Icons.photo_library_outlined,
          leading: thumbnailUrl == null
              ? const Icon(Icons.photo_outlined)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image_outlined),
                  ),
                ),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => AlbumPhotosScreen(album: widget.album),
            ),
          ),
        );
      },
    );
  }
}
