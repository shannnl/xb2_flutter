import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/exception/http_exception.dart';
import 'package:xb2_flutter/auth/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthModel extends ChangeNotifier {
  String userId = '';
  String name = '';
  String token = '';

  bool get isLoggedIn => token.isNotEmpty;

  setAuth(Auth auth) {
    userId = '${auth.id}';
    name = auth.name;
    token = auth.token;

    notifyListeners();
  }

  storeAuth(Auth auth) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('auth', jsonEncode(auth));
  }

  removeAuth() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth');
  }

  Future<Auth> login(LoginData data) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/login');

    final response = await http.post(uri,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data.toJson()));
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final auth = Auth.fromJson(responseBody);

      userId = auth.id.toString();
      name = auth.name;
      token = auth.token;
      storeAuth(auth);
      notifyListeners();
      return auth;
    } else {
      throw HttpException(responseBody['message'] ?? '网络请求出了点问题 🌋');
    }
  }

  logout() {
    userId = '';
    name = '';
    token = '';

    removeAuth();
    notifyListeners();
  }
}



  // login() {
  //   isLoggedIn = true;
  //   name = 'shannnl';
  //   print('请求登录！');
  //   notifyListeners();
  // }

  // logout() {
  //   isLoggedIn = false;
  //   name = '';
  //   print('退出登录！');
  //   notifyListeners();
  // }
// }
