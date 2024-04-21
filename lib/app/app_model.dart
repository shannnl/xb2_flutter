import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  String pageName = '';
  String? resourceId;

  setPageName(String data) {
    pageName = data;
    notifyListeners();
  }

  setResourceId(String data) {
    resourceId = data;
    notifyListeners();
  }
}
