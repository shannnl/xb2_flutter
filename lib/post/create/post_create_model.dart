import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';

class PostCreateModel extends ChangeNotifier {
  final AppService appService;

  PostCreateModel({
    required this.appService,
  });

  String? title;
  String? content;
  XFile? selectedFile;
  bool loading = false;

  setTitle(String? data) {
    title = data;
  }

  setContent(String? data) {
    content = data;
  }

  setSelectedFile(XFile? data) {
    selectedFile = data;
    notifyListeners();
  }

  setLoading(bool data) {
    loading = data;
    notifyListeners();
  }

  reset() {
    title = null;
    content = null;
    selectedFile = null;
  }

  // 是否保留未发布的内容
  bool hasData() {
    return title != null || content != null || selectedFile != null
        ? true
        : false;
  }

  Future<int> createPost() async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts');

    final response =
        await appService.apiHttpClient.post(uri, headers: <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    }, body: jsonEncode({
      'title': title,
      'content': content,
    }));


    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 201) {
      final postId = responseBody['insertId'];
      return postId;
    } else {
      throw HttpException(responseBody['message']);
    }
  }

  Future<bool> createFile({required int postId}) async {
    final response = await appService.apiHttpClient.uploadImage(
      postId: postId,
      file: selectedFile!,
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw HttpException('上传文件失败了。');
    }
  }
}

