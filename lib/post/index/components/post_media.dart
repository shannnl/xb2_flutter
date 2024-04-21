import 'package:flutter/material.dart';
import 'package:select_demo/app/app_config.dart';
import 'package:select_demo/post/post.dart';

class PostMedia extends StatelessWidget {
  final Post post;

  PostMedia({required this.post});

  @override
  Widget build(BuildContext context) {
    final fileId = post.file?.id;
    final imageUrl =
    '${AppConfig.apiBaseUrl}/files/$fileId/serve?size=medium';
    return Container(
      child: Image.network(imageUrl),
    );
  }
}