import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_model.dart';
// import 'package:xb2_flutter/playground/routing/components/about.dart';

class PlaygroundRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    return Container(
      color: Colors.white,
      child: Center(
        child: TextButton(
          child: Text('查看内容'),
          onPressed: (){
            appModel.setPageName('About');
           
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return About();
            //   }
            // ));
            // Navigator.pushNamed(context, "/about");
            // Navigator.pushNamed(
            //   context,
            //   // "/about",
            //   "/posts/6",
            //   arguments: {"user": "shannl navigator"},
            // );
          },
        ),
      ),
    );
  }
}
