import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post.dart';

/// 投稿リポジトリインタフェースプロバイダー
/// 通常アプリ起動時 or テスト時に本プロバイダーをoverrideして使用してください
final postRepositoryProvider = Provider<IPostRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// PostRepositoryから投稿一覧を取得するプロバイダー
final postsProvider = FutureProvider(
  (ref) async {
    final repository = ref.watch(postRepositoryProvider);
    repository.postsChanges().listen((latest) {
      ref.state = AsyncValue.data(latest);
    });
    return repository.fetchPosts();
  },
);

/// 投稿リポジトリインタフェース
abstract class IPostRepository {
  /// Create
  Future<void> addPost({required Post post});

  /// Read
  Stream<List<Post>> postsChanges();
  Future<List<Post>> fetchPosts();

  /// Update
  Future<void> updatePost({required Post post});

  /// Delete
  Future<void> deletePostFromId({required String docId});

  /// 破棄処理の実装をルール付けておく
  void dispose();
}
