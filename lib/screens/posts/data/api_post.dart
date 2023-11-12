import 'dart:convert';

import 'package:bloc_app/screens/posts/model/post.dart';
import 'package:http/http.dart' as http;

class ApiPost {
  Future<List<PostModel>> getPosts([int startIndex = 0, int limit = 10]) async {
    String url =
        "https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit";
    try {
      final responce = await http.get(Uri.parse(url));
      if (responce.statusCode == 200) {
        List<PostModel> listPost = (json.decode(responce.body))
            .map<PostModel>((jsonMap) => PostModel.formJson(jsonMap))
            .toList();
        return listPost;
      } else {
        return [];
      }
    } catch (_) {
      rethrow;
    }
  }
}
