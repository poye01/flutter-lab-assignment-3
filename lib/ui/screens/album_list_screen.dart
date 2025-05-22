import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/album_bloc.dart';
import 'package:flutter_lab_assignment_3/ui/widgets/album_tile.dart';
import 'package:go_router/go_router.dart';

class AlbumListScreen extends StatelessWidget {
  const AlbumListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums', style: theme.textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), // Navigates back to the Onboarding Screen
        ),
      ),
      body: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Error: ${state.error}', style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => context.read<AlbumCubit>().fetchAlbums(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: state.albums.length,
            itemBuilder: (context, index) {
              final data = state.albums[index];
              return AlbumTile(
                title: data['album'].title,
                imageUrl: data['photo'].thumbnailUrl,
                onTap: () => context.push('/detail', extra: data),
              );
            },
          );
        },
      ),
    );
  }
}
