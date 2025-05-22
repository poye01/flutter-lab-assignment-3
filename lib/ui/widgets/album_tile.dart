import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const AlbumTile({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Use placeholder image if imageUrl is empty
    final displayImageUrl = imageUrl.isEmpty
        ? 'https://via.placeholder.com/150'
        : imageUrl;

    return ListTile(
      leading: Image.network(
        displayImageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.broken_image),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        },
      ),
      title: Text(title, style: theme.textTheme.bodyLarge),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
