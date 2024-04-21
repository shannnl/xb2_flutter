import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_demo/app/components/app_no_content.dart';
import 'package:select_demo/post/post.dart';
import 'package:select_demo/post/show/components/post_show_main.dart';
import 'package:select_demo/post/show/post_show_model.dart';

class PostShow extends StatefulWidget {
  final String postId;
  final Post? post;

  PostShow(
    this.postId, {
    this.post,
  });

  @override
  State<PostShow> createState() => _PostShowState();
}

class _PostShowState extends State<PostShow> {
  @override
  void initState() {
    super.initState();

    if (widget.post == null) {
      context.read<PostShowModel>().getPostById(widget.postId);
    }
  }

  @override
  Widget build(BuildContext context) {
    Post? post = widget.post;

    if (widget.post == null) {
      post = context.watch<PostShowModel>().post;
    }

    return Scaffold(
      body: post != null ? PostShowMain(post: post) : AppNoContent(),
      // body: PostShowMain(post: widget.post!),

      // appBar: AppBar(),
      // body: Center(
      //   child: Text(
      //     // '内容：$postId \n ${post!.title!}',
      //     post!.title!,
      //     style: Theme.of(context).textTheme.titleLarge,
      //   ),
      // ),
    );
  }
}
