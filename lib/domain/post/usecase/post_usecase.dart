import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 投稿ユースケースインタフェースプロバイダー
/// 通常アプリ起動時 or テスト時に本プロバイダーをoverrideして使用してください
final postUsecaseProvider = Provider<PostUsecase>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

/// 投稿ユースケースインタフェース
abstract class PostUsecase {
  /// 新規投稿ボタン押下時処理
  Future<void> addPost({required String content, required String contributor});

  /// 投稿編集ボタン押下時
  Future<void> updatePost({
    required String id,
    required String content,
    required String contributor,
  });

  /// 削除ボタン押下時処理
  Future<void> deletePost({required String id});
}
