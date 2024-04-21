import 'package:flutter/material.dart';
import 'package:select_demo/post/components/post_actions.dart';
import 'package:select_demo/post/post.dart';
import 'package:select_demo/user/components/user_avatar.dart';

class PostHeader extends StatelessWidget {
  final Post post;

  PostHeader({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(
            user: post.user!,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  post.user!.name!,
                ),
              ],
            ),
          ),
          PostActions(post: post),
        ],
      ),
    );
  }
}
