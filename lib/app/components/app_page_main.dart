import 'package:flutter/material.dart';
import 'package:select_demo/playground/playground.dart';
import 'package:select_demo/post/create/post_creat.dart';
import 'package:select_demo/post/index/post_index.dart';
import 'package:select_demo/user/profile/user_profile.dart';

class AppPageMain extends StatelessWidget {

  final int currentIndex;

  AppPageMain({this.currentIndex = 0});
  
  final pageMain = [
    //发现
    PostIndex(),
    //添加
    PostCreate(),
    //用户
    UserProfile(),
    //练习
    Playground(),
  ];


  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(currentIndex);
  }
}