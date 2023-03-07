import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// GoRouterの設定
final routerConfigProvider = Provider<GoRouter>(
  (ref) => GoRouter(routes: <RouteBase>[GoRoute(path: '/')]),
);
