import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/app/app_provider.dart';
import 'package:xb2_flutter/app/router/app_route_information_parser.dart';
import 'package:xb2_flutter/app/router/app_router_delegate.dart';
// import 'package:xb2_flutter/app/components/app_home.dart';
// import 'package:xb2_flutter/app/components/app_floating_action_button.dart';
// import 'package:xb2_flutter/app/components/app_page_aside.dart';
// import 'package:xb2_flutter/app/components/app_page_bottom.dart';
// import 'package:xb2_flutter/app/components/app_page_header.dart';
// import 'package:xb2_flutter/app/components/app_page_main.dart';
import 'package:xb2_flutter/app/themes/app_theme.dart';
import 'package:xb2_flutter/auth/auth.dart';
import 'package:xb2_flutter/auth/auth_Model.dart';
import 'package:xb2_flutter/post/post_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:xb2_flutter/post/show/post_show_model.dart';
// import 'package:xb2_flutter/playground/routing/components/about.dart';
// import 'package:xb2_flutter/post/show/post_show.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthModel authModel = AuthModel();
  final AppModel appModel = AppModel();

  bool initializing = true;

  initialize() async {
    final prefs = await SharedPreferences.getInstance();

    final hasAuth = prefs.containsKey('auth');

    if (hasAuth) {
      final auth = Auth.fromJson(
        jsonDecode(prefs.getString('auth')!),
      );

      authModel.setAuth(auth);
    }

    setState(() {
      initializing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    if (initializing) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Text('初始化...'),
          ),
        ),
      );
    }
    // return Provider(
    // return ChangeNotifierProvider(
    // create: (context) => AuthModel(),
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<AuthModel>(create: (context) => AuthModel()),
        // ChangeNotifierProvider<AppModel>(create: (context) => appModel),
        // ChangeNotifierProvider<PostShowModel>( create: (context) => PostShowModel()),
        ChangeNotifierProvider<AuthModel>.value(value: authModel),
        ChangeNotifierProvider<AppModel>.value(value: appModel),
        ...appProviders,
        ...postProviders,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerDelegate: AppRouterDelegate(appModel),
        routeInformationParser: AppRouteInformationParser(),
      ),
    );
  }
}

        // home: AppHome(),
        // initialRoute: "/",

        // home: Router(routerDelegate: AppRouterDelegate(appModel),)

        // home: Consumer<AppModel>(
        //   builder: (context, state, child) => Navigator(
            // pages: [
            //   MaterialPage(
            //     key: ValueKey('AppHome'),
            //     child: AppHome(),
            //   ),
            //   if (state.pageName == 'About')
            //     MaterialPage(
            //       key: ValueKey('About'),
            //       child: About(),
            //     ),
            // ],
            // onPopPage: (route, result) {
            //   if (!route.didPop(result)) {
            //     return false;
            //   }

            //   state.setPageName('');

            //   return true;
            // },
        //   ),
        // ),

        // home: Navigator(
        //   pages: [
        //     MaterialPage(
        //       key: ValueKey('AppHome'),
        //       child: AppHome(),
        //     ),
        //     MaterialPage(
        //       key: ValueKey('About'),
        //       child: About(),
        //     ),
        //   ],
        // ),

        // routes: {
        //   "/": (context) => AppHome(),
        //   '/about': (context) => About(),
        // },

        // onGenerateRoute: (settings) {
        //   print(settings);

        //   if (settings.name == '/') {
        //     return MaterialPageRoute(builder: (context) => AppHome());
        //   }

        //   if (settings.name == '/about') {
        //     return MaterialPageRoute(builder: (context) => About());
        //   }

        //   final uri = Uri.parse(settings.name ?? '');

        //   if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'posts') {
        //     final postId = uri.pathSegments[1];

        //     return MaterialPageRoute(builder: (context) => PostShow(postId));
        //   }
        //   return null;
        // },
//       ),
//     );
//   }
// }

// home: Center(
//   child: FilledButton(
//     child: Text("shannnl"),
//     onPressed: () {
//       print("你好");
//     },
//     ),

// child: Icon(
//   Icons.landscape_rounded,
//   color: Colors.amber,
//   size:128,
//   ),

// child: Text(
//   "shannnl"),
//       ),

//     );
//   }
// }
