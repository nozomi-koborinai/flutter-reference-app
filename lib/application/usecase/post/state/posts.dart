import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/post/post_repository.dart';

/// PostRepositoryから投稿一覧を取得するプロバイダー
final postsProvider = StreamProvider(
  (ref) => ref.watch(postRepositoryProvider).streamAllPosts(),
);
