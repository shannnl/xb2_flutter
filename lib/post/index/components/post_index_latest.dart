import 'package:flutter/material.dart';
import 'package:select_demo/post/index/components/post_list.dart';

class PostIndexLatest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: PostList(),
    );
    // return Icon(
    //   Icons.explore_outlined,
    //   size: 128,
    //   color: Colors.black12,
    // );
  }
}
