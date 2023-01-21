import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post.dart';

/// 投稿リポジトリインタフェースプロバイダー
/// 通常アプリ起動時 or テスト時に本プロバイダーをoverrideして使用してください
final postRepositoryProvider = Provider<IPostRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// 投稿リポジトリインタフェース
abstract class IPostRepository {
  Future<void> addPost(Post newPost);
  Future<List<Post>> fetchPostFromUserId(String id);
  Future<void> deletePostFromId(String id);
}
