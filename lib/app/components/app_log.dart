import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color color;
  AppLogo({
    this.size = 32,
    this.color = Colors.black38
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
              'assets/images/logo.png',
              width: size,
              color: color,
            );
  }
}