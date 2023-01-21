import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/application/state/result.dart';
import 'package:riverpod_layered_architecture/domain/repositories/post_repository.dart';

import '../domain/models/post.dart';

/// 投稿サービスプロバイダー
final postServiceProvider = Provider(
  PostService.new,
);

/// 投稿サービス
///
/// 投稿に関する操作を提供する
/// Widget から呼ばれ、各 Repository や State を操作するロジックを実装する
class PostService {
  const PostService(this.ref);
  final Ref ref;

  /// 新規投稿ボタン押下時処理
  addPost({required String content, required String contributor}) async {
    /// 処理開始なので状態をローディングに設定する
    final notifier = ref.read(addPostResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      return await ref
          .read(postRepositoryProvider)
          .addPost(post: Post(content: content, contributor: contributor));
    });
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
  deletePost({required String id}) async {
    /// 処理開始なので状態をローディングに設定する
    final notifier = ref.read(deletePostResultProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(
      () async {
        await ref.read(postRepositoryProvider).deletePostFromId(docId: id);
      },
    );
  }
}
