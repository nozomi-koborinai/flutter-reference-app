import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/post.dart';

/// 投稿リポジトリインタフェースプロバイダー
/// 通常アプリ起動時 or テスト時に本プロバイダーをoverrideして使用してください
final postRepositoryProvider = Provider<PostRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// 投稿リポジトリインタフェース
interface class IPostRepository {
  Future<void> addPost({required Post post}) => throw UnimplementedError();
  Stream<List<Post>> streamAllPosts() => throw UnimplementedError();
  Future<void> updatePost({required Post post}) => throw UnimplementedError();
  Future<void> deletePostFromId({required String docId}) =>
      throw UnimplementedError();

  /// 破棄処理の実装をルール付けておく
  void dispose() => throw UnimplementedError();
}

/// 投稿リポジトリインタフェース
abstract interface class PostRepository {
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
