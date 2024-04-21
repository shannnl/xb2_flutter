import 'package:flutter/material.dart';
import 'package:select_demo/post/post.dart';

class PostTags extends StatelessWidget {
  final List<PostTag> tags;

  PostTags({
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: tags.map((tag) {
          return Chip(label: Text(tag.name!));
        }).toList(),
      ),
    );
  }
}
