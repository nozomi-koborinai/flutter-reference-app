import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/post/usecase/post_usecase.dart';
import '../../domain/post/entity/post.dart';
import '../../domain/post/post_repository.dart';
import '../run_usecase_mixin.dart';

/// 投稿サービスプロバイダー
final postServiceProvider = Provider(
  PostService.new,
);

/// 投稿サービス
class PostService with RunUsecaseMixin implements PostUsecase {
  PostService(this.ref) {
    postRepository = ref.read(postRepositoryProvider);
  }
  final Ref ref;
  late IPostRepository postRepository;

  /// 新規投稿ボタン押下時処理
  @override
  Future<void> addPost({
    required String content,
    required String contributor,
  }) async {
    final post = Post(content: content, contributor: contributor);
    await execute(ref, () => postRepository.addPost(post: post));
  }

  /// 投稿編集ボタン押下時
  @override
  Future<void> updatePost({
    required String id,
    required String content,
    required String contributor,
  }) async {
    final post = Post(id: id, content: content, contributor: contributor);
    await execute(ref, () => postRepository.updatePost(post: post));
  }

  /// 削除ボタン押下時処理
  @override
  Future<void> deletePost({
    required String id,
  }) async {
    await execute(ref, () => postRepository.deletePostFromId(docId: id));
  }
}
