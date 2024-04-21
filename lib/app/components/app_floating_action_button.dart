import 'package:flutter/material.dart';
import 'package:select_demo/app/components/app_bottom_sheet.dart';

class AppFloatingActionButton extends StatefulWidget {
  @override
  State<AppFloatingActionButton> createState() =>
      _AppFloatingActionButtonState();
}

class _AppFloatingActionButtonState extends State<AppFloatingActionButton> {
  //是否正在显示底部面板
  bool isBottomSheetShown = false;

  //漂浮按钮小图标
  Icon floatingActionButtonIcon() {
    return isBottomSheetShown ? Icon(Icons.close) : Icon(Icons.support_agent);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: floatingActionButtonIcon(),
      onPressed: () {
        //关闭底部面板
        if (isBottomSheetShown) {
          return Navigator.pop(context);
        }
        //显示底部面板
        final bottomSheetController = showBottomSheet(
          context: context,
          builder: (context) => AppBottomSheet(),
        );

        setState(() {
          isBottomSheetShown = true;
        });

        //关闭底部面板后
        bottomSheetController.closed.then((value){
          setState((){
            isBottomSheetShown = false;
          });
      });
  },
      
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white70,
    );
  }
}
