import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_demo/app/app_model.dart';
import 'package:select_demo/post/index/components/post_header.dart';
import 'package:select_demo/post/index/components/post_media.dart';
import 'package:select_demo/post/post.dart';
import 'package:select_demo/post/show/post_show_model.dart';

// enum PostListLayout {
//   stack,
//   grid,
// }

class PostListItem extends StatelessWidget {
  final Post item;

  PostListItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final appModel = context.read<AppModel>();
    final postShowModel = context.read<PostShowModel>();

    final postListItemMediaMask = Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.deepPurpleAccent.withOpacity(0.3),
          onTap: () {
            // print('onTap postListItemMedia');
            appModel.setPageName('PostShow');
            appModel.setResourceId('${item.id}');
            postShowModel.setPost(item);
          },
        ),
      ),
    );

    final postListItemMedia = Stack(
      children: [
        PostMedia(post: item),
        postListItemMediaMask,
      ],
    );

    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          // PostMedia(post: item),
          postListItemMedia,
          SizedBox(
            height: 8,
          ),
          PostHeader(post: item),
          // Text(
          //   item.title!,
          //   style: Theme.of(context).textTheme.titleLarge,
          // ),
        ],
      ),
    );
  }
}
