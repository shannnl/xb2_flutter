import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_demo/app/app_model.dart';
import 'package:select_demo/app/components/app_button.dart';
import 'package:select_demo/app/components/app_header_text.dart';
import 'package:select_demo/app/components/app_password_filed.dart';
import 'package:select_demo/app/components/app_text_filed.dart';
import 'package:select_demo/app/exception/http_exception.dart';
import 'package:select_demo/auth/auth.dart';
import 'package:select_demo/auth/auth_Model.dart';

class AuthLoginForm extends StatefulWidget {
  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {
  String? name;
  String? password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthModel>(context, listen: true);
    final appModel = context.read<AppModel>();

    // 标题
    // final header = Text('用户登录');
    final header = AppHeaderText('用户登录');

    // 用户
    // final nameField = Text('用户');
    final nameField = AppTextField(
      labelText: '用户',
      onChanged: (value) {
        name = value;
      },
    );

    // 密码
    // final passwordField = Text('密码');
    final passwordField = AppPasswordField(
      onChanged: (value) {
        password = value;
      },
    );

    // 提交
    // final submitButton = Text('确定登录');
    // final submitButton = AppButton(
    //   onPressed: () {},
    //   text: '确定登录',
    // );
    final submitButton = AppButton(
      onPressed: () async {
        formKey.currentState!.validate();

        try {
          await authModel.login(
            LoginData(
              name: name!,
              password: password!,
            ),
          );

          appModel.setPageName('');
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message)),
          );
        }
      },
      text: '确定登录',
    );

    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            nameField,
            passwordField,
            submitButton,
          ],
        ),
      ),
    );

    // final LoginButton = ElevatedButton(
    //     onPressed: () {
    //       print('已登录：${authModel.isLoggedIn}');
    //       authModel.login();
    //       print('已登录：${authModel.isLoggedIn}');
    //     },
    //     child: Text("登录"));

    // final LogoutButton = ElevatedButton(
    //     onPressed: () {
    //       print('已登录：${authModel.isLoggedIn}');
    //       authModel.logout();
    //       print('已登录：${authModel.isLoggedIn}');
    //     },
    //     child: Text("退出登录"));

    // return Container(
    //   child: authModel.isLoggedIn ? LogoutButton : LoginButton,
    // );
  }
}
