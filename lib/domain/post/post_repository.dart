import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/post.dart';

/// 投稿リポジトリインタフェースプロバイダー
/// 通常アプリ起動時 or テスト時に本プロバイダーをoverrideして使用してください
final postRepositoryProvider = Provider<IPostRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// PostRepositoryから投稿一覧を取得するプロバイダー
final postsProvider = StreamProvider(
  (ref) => ref.watch(postRepositoryProvider).streamAllPosts(),
);

/// 投稿リポジトリインタフェース
abstract class IPostRepository {
  /// Create
  Future<void> addPost({required Post post});

  /// Read
  Stream<List<Post>> streamAllPosts();

  /// Update
  Future<void> updatePost({required Post post});

  /// Delete
  Future<void> deletePostFromId({required String docId});

  /// 破棄処理の実装をルール付けておく
  void dispose();
}
