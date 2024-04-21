import 'package:flutter/material.dart';
import 'package:select_demo/playground/http/playground_http.dart';
// import 'package:select_demo/playground/input/playground_input.dart';
// import 'package:select_demo/playground/routing/playground_routing.dart';
// import 'package:select_demo/playground/state/playground_state.dart';
// import 'package:select_demo/playground/layout/playground_layout.dart';

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return PlaygroundLayout();
    // return PlaygroundInput();
    // return PlaygroundRouting();
    // return PlaygroundState();
    // return PlaygroundRouting();
    return playgroundHttp();
  }
}