import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:select_demo/app/components/app_log.dart';
// import 'package:select_demo/playground/layout/components/layout_playground_item.dart';

class PlaygroundLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.greenAccent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              'https://resources.ninghao.net/images/IMG_2680.JPG',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: AppLogo(size: 64,color: Colors.white,)),
            
          ],
        ),

        // child: SafeArea(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Expanded(flex:2, child:PlaygroundLayoutItem("1")),
        //       Expanded(flex:1, child: PlaygroundLayoutItem("2")),
        //       PlaygroundLayoutItem("3"),
        //     ],
        //   ),
        // ),
      ),
    );

    // return Container(
    //   color: Colors.greenAccent,
    //   width: 200,
    //   height: 200,
    //   child: Center(
    //     child: Container(
    //       color: Colors.deepPurpleAccent,
    //       width: 100,
    //       height: 100,
    //     ),
    //   ),
    // );
  }
}
