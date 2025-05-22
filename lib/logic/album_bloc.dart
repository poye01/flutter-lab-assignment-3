import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/album_repository.dart';

class AlbumState {
  final List<Map<String, dynamic>> albums;
  final bool loading;
  final String? error;

  AlbumState({required this.albums, required this.loading, this.error});

  factory AlbumState.initial() => AlbumState(albums: [], loading: true);
}

class AlbumCubit extends Cubit<AlbumState> {
  final AlbumRepository repository;

  AlbumCubit(this.repository) : super(AlbumState.initial());

  void fetchAlbums() async {
    try {
      emit(AlbumState(albums: [], loading: true));
      final albums = await repository.fetchAlbumsWithPhotos();
      emit(AlbumState(albums: albums, loading: false));
    } catch (e) {
      emit(AlbumState(albums: [], loading: false, error: e.toString()));
    }
  }
}
