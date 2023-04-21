import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/page/post/post_page.dart';
import 'package:flutter_reference_app/presentation/page/time_line/time_line_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// GoRoute.path/name プロパティの設定値を保持する列挙体
enum RouteConfigs {
  timeLine('/', 'time-line'),
  post('post', 'post');

  const RouteConfigs(this.path, this.name);
  final String path;
  final String name;
}

// GoRouterの設定
final routerConfigProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteConfigs.timeLine.path,
        name: RouteConfigs.timeLine.name,
        builder: (BuildContext context, GoRouterState state) =>
            const TimeLinePage(),
        routes: <RouteBase>[
          GoRoute(
            path: RouteConfigs.post.path,
            name: RouteConfigs.post.name,
            builder: (BuildContext context, GoRouterState state) =>
                const PostPage(),
          ),
        ],
      ),
    ],
  ),
);
