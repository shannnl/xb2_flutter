import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_config.dart';
// import 'package:http/http.dart' as http;
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/post/post.dart';

class PostIndexModel extends ChangeNotifier {
  // dynamic posts;

  // PostIndexModel(){
  //   getPosts();
  // }

  List<Post>? posts;
  final AppService appService;

  PostIndexModel({
    required this.appService,
    this.posts,
  });

  List<Post> parsePosts(responseBody) {
    final List<Post> parsed = jsonDecode(responseBody)
        .map<Post>((item) => Post.fromJson(item))
        .toList();
    return parsed;
  }

  Future<List<Post>> getPosts() async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts');
    print("##############$uri");
    // final response = await http.get(uri);
    final response = await appService.apiHttpClient.get(uri);
    print("#####response $response");
    final parsed = parsePosts(response.body);

    posts = parsed;
    notifyListeners();
    return parsed;
  }
}
