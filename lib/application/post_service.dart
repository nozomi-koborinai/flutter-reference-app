import 'package:flutter_reference_app/application/run_usecase_mixin.dart';
import 'package:flutter_reference_app/application/state/overlay_loading_provider.dart';
import 'package:flutter_reference_app/application/state/result.dart';
import 'package:flutter_reference_app/domain/repositories/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/post.dart';

/// 投稿サービスプロバイダー
final postServiceProvider = Provider(
  PostService.new,
);

/// 投稿サービス
class PostService with RunUsecaseMixin {
  const PostService(this.ref);
  final Ref ref;

  /// 新規投稿ボタン押下時処理
  Future<void> addPost({
    required String content,
    required String contributor,
  }) async {
    ref.read(overlayLoadingProvider.notifier).update((_) => true);
    try {
      await ref.read(postRepositoryProvider).addPost(
            post: Post(
              content: content,
              contributor: contributor,
            ),
          );
    } catch (e) {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((_) => false);
    }
  }

  /// 投稿編集ボタン押下時
  updatePost({
    required String id,
    required String content,
    required String contributor,
  }) async {
    /// 処理開始なので状態をローディングに設定する
    final notifier = ref.read(updatePostResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(
      () async {
        await ref.read(postRepositoryProvider).updatePost(
              post: Post(
                id: id,
                content: content,
                contributor: contributor,
              ),
            );
      },
    );
  }

  /// 削除ボタン押下時処理
  Future<void> deletePost({required String id}) async {
    ref.read(overlayLoadingProvider.notifier).update((_) => true);
    try {
      await ref.read(postRepositoryProvider).deletePostFromId(docId: id);
    } catch (e) {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((_) => false);
    }
  }
}
