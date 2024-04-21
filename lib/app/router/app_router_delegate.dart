import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_demo/app/app_model.dart';
import 'package:select_demo/app/components/app_home.dart';
import 'package:select_demo/app/router/app_router_configuration.dart';
import 'package:select_demo/auth/login/auth_login.dart';
import 'package:select_demo/playground/routing/components/about.dart';
import 'package:select_demo/post/show/post_show.dart';
import 'package:select_demo/post/show/post_show_model.dart';

class AppRouterDelegate extends RouterDelegate<AppRouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AppModel appModel;

  AppRouterDelegate(this.appModel)
      : _navigatorKey = GlobalKey<NavigatorState>() {
    // 监听 appModel
    appModel.addListener(notifyListeners);
  }

  // 销毁资源
  @override
  void dispose() {
    super.dispose();

    // 取消监听 appModel
    appModel.removeListener(notifyListeners);
  }

  @override
  get navigatorKey => _navigatorKey;

  @override
  setNewRoutePath(configuration) async {
    print('设置新路由地址 setNewRoutePath');
    print(configuration.pageName);

    if (configuration.isHomePage) {
      appModel.setPageName('');
    }

    if (configuration.isAboutPage) {
      appModel.setPageName('About');
    }

    if (configuration.isPostShow) {
      appModel.setPageName('PostShow');
      appModel.setResourceId('${configuration.resourceId}');
    }

    // return Future.value();
  }

  // 当前路由配置
  @override
  get currentConfiguration {
    if (appModel.pageName == '') {
      return AppRouteConfiguration.home();
    }

    if (appModel.pageName == 'About') {
      return AppRouteConfiguration.about();
    }

    if (appModel.pageName == 'PostShow') {
      return AppRouteConfiguration.postShow(appModel.resourceId);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final postShowModel = context.read<PostShowModel>();
    // var postShowModel;
    return Navigator(
      // key: _navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('AppHome'),
          child: AppHome(),
        ),
        if (appModel.pageName == 'About')
          MaterialPage(
            key: ValueKey('About'),
            child: About(),
          ),
        if (appModel.pageName == 'PostShow' && appModel.resourceId != null)
          MaterialPage(
            key: ValueKey('PostShow'),
            child: PostShow(
              appModel.resourceId!,
              post: postShowModel.post,
            ),
          ),
        if (appModel.pageName == 'AuthLogin')
          MaterialPage(
            key: ValueKey('AuthLogin'),
            child: AuthLogin(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        appModel.setPageName('');

        return true;
      },
    );
  }
}
