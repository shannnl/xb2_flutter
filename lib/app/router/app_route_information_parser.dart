import 'package:flutter/material.dart';
import 'package:select_demo/app/router/app_router_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<AppRouteConfiguration> {
// 解析路由信息
  @override
  parseRouteInformation(routeInformation) async {
    final uri = Uri.parse(routeInformation.uri.path ?? '');

    // print('解析路由信息 parseRouteInformation');
    // print(routeInformation.uri.path);

    if (routeInformation.uri.path == '/about') {
      return AppRouteConfiguration.about();
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'posts') {
      return AppRouteConfiguration.postShow(uri.pathSegments[1]);
    }

    return AppRouteConfiguration.home();
  }

  // 恢复路由信息
  @override
  restoreRouteInformation(configuration) {
    if (configuration.isHomePage) {
      return RouteInformation(uri: Uri.parse('/'));
    }

    if (configuration.isAboutPage) {
      return RouteInformation(uri: Uri.parse('/about'));
    }

    if (configuration.isPostShow) {
      return RouteInformation(uri: Uri.parse('/posts/${configuration.resourceId}'));
    }

    return null;
  }
}
