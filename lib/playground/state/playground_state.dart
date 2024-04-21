import 'package:flutter/material.dart';
import 'package:select_demo/auth/login/auth_login.dart';

class PlaygroundState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: AuthLogin(),
    );
  }
}