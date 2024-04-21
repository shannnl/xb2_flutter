import 'package:provider/provider.dart';
import 'package:select_demo/app/app_service.dart';
import 'package:select_demo/post/index/post_index_model.dart';
import 'package:select_demo/post/show/post_show_model.dart';

final postShowProvider = ChangeNotifierProvider<PostShowModel>(
  create: (context) => PostShowModel(),
);

// final postIndexProvider = ChangeNotifierProvider(
//   create: (_) => PostIndexModel(),
// );

final postIndexProvider = 
ChangeNotifierProxyProvider<AppService, PostIndexModel>(
  create: (context) => PostIndexModel(appService: context.read<AppService>()),
  update: (context, appService, postIndexModel) {
    return PostIndexModel(
      appService: appService,
      posts: postIndexModel?.posts,
    );
  },
);

final postProviders = [
  postShowProvider,
  postIndexProvider,
];
