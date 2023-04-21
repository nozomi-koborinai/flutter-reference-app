import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 投稿ユースケースプロバイダー
/// 通常アプリ起動時 or テスト時に本プロバイダーをoverrideして使用してください
final postUsecaseProvider = Provider<PostUsecase>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// 投稿ユースケースインタフェース
abstract class PostUsecase {
  /// 新規投稿をする
  Future<void> addPost({required String content, required String contributor});

  /// 投稿を編集する
  Future<void> updatePost({
    required String id,
    required String content,
    required String contributor,
  });

  /// 投稿を削除する
  Future<void> deletePost({required String id});
}
