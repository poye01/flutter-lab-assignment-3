import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';
import '../models/photo_model.dart';

class AlbumRepository {
  final http.Client client;

  AlbumRepository({required this.client});

  Future<List<Map<String, dynamic>>> fetchAlbumsWithPhotos() async {
    final albumRes = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final photoRes = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (albumRes.statusCode != 200 || photoRes.statusCode != 200) {
      throw Exception('Failed to fetch data');
    }

    final albums = (json.decode(albumRes.body) as List).map((e) => Album.fromJson(e)).toList();
    final photos = (json.decode(photoRes.body) as List).map((e) => Photo.fromJson(e)).toList();

    return albums.map((album) {
      final photo = photos.firstWhere((p) => p.albumId == album.id, orElse: () => Photo(albumId: album.id, title: '', thumbnailUrl: ''));
      return {
        'album': album,
        'photo': photo,
      };
    }).toList();
  }
}
