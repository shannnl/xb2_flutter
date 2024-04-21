import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:select_demo/app/app_config.dart';
import 'dart:convert';

import 'package:select_demo/user/user.dart';

class playgroundHttp extends StatefulWidget {
  @override
  State<playgroundHttp> createState() => _playgroundHttpState();
}

class _playgroundHttpState extends State<playgroundHttp> {
  String? currentUserName;
  String? currentUserToken;

  getUser() async {
    // final uri = Uri.parse('http://localhost:3001/users/1');
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/users/1');
    final response = await http.get(uri);

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');

    if (response.statusCode == 200) {
      // final user = jsonDecode(response.body);
      // print('解码之后 $user');
      // print(user['name']);

      final user = User.fromJson(response.body);
      print('解码之后 $user');
      print('id: ${user.id}, name: ${user.name}');
    }
  }

  createUser() async {
    final name = '王小八';
    final password = '123456';

    final uri = Uri.parse('http://localhost:3001/users');
    print(uri);

    final response = await http.post(
      uri,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'password': password,
      }),
    );

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');
  }

  login() async {
    final name = '王小八';
    final password = '123456';

    final uri = Uri.parse('http://localhost:3001/login');

    final response = await http.post(uri,
    headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    body: jsonEncode({
      'name': name,
      'password': password,
    })
    );

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      setState(() {
        currentUserName = responseBody['name'];
        currentUserToken = responseBody['token'];
      });
    }
  }

  updateUser() async {
    final name = '王小七';

    final password = '123456';

    final uri = Uri.parse('http://localhost:3001/users');

    final headers = {
      'Authorization': 'Bearer $currentUserToken',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    final body = jsonEncode({
      'validate': {
        'password': password,
      },
      'update': {'name': name},
    });

    final response = await http.patch(
      uri,
      headers: headers,
      body: body,
    );

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentUserName ?? '未登录',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(
            child: Text('发送请求'),
            onPressed: getUser,
          ),
          ElevatedButton(
            child: Text('创建用户'),
            onPressed: createUser,
          ),
          ElevatedButton(
            child: Text('用户登录'),
            onPressed: login,
          ),
          ElevatedButton(
            child: Text('更新用户'),
            onPressed: updateUser,
          ),
        ],
      ),
    );
  }
}
