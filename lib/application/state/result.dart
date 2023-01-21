import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 新規投稿結果プロバイダー
final addPostResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
);

/// 投稿変更結果プロバイダー
final updatePostResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
);

/// 投稿削除結果プロバイダー
final deletePostResultProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
);
