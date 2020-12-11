import 'package:unsplash_test_app/model.dart';
import 'dart:convert';
import 'dart:io';
import 'package:unsplash_test_app/key.dart';

class UnsplashPhotoProvider {
  static Future<UnsplPhoto> loadImage(String id) async {
    String url = 'https://api.unsplash.com/photos/$id';
    var data = await _getImageData(url);
    return UnsplPhoto(data);
  }

  static Future<List> loadImages({int page = 1, int perPage = 10}) async {
    String url = 'https://api.unsplash.com/photos?page=$page&per_page=$perPage';
    var data = await _getImageData(url);
    List<UnsplPhoto> images = List<UnsplPhoto>.generate(data.length, (index) {
      return UnsplPhoto(data[index]);
    });
    return images;
  }

  static Future<List> loadImagesWithKeyword(String keyword,
      {int page = 1, int perPage = 10}) async {
    String url =
        'https://api.unsplash.com/search/photos?query=$keyword&page=$page&per_page=$perPage&order_by=popular';
    var data = await _getImageData(url);
    List<UnsplPhoto> images =
        List<UnsplPhoto>.generate(data['results'].length, (index) {
      return UnsplPhoto(data['results'][index]);
    });
    int totalPages = data['total_pages'];
    return [totalPages, images];
  }

  static dynamic _getImageData(String url) async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Authorization', 'Client-ID $keys');
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String json = await response.transform(utf8.decoder).join();
      return jsonDecode(json);
    } else {
      print("Http error: ${response.statusCode}");
      return [];
    }
  }
}
