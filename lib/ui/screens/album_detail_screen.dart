import 'package:flutter/material.dart';

class AlbumDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  AlbumDetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    final album = data['album'];
    final photo = data['photo'];

    // Add placeholder if thumbnailUrl is null or empty
    final imageUrl = (photo.thumbnailUrl != null && photo.thumbnailUrl.isNotEmpty)
        ? photo.thumbnailUrl
        : 'https://via.placeholder.com/150';

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Album Detail')),
      body: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 100),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Title: ${album.title}',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Album ID: ${album.id}',
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
