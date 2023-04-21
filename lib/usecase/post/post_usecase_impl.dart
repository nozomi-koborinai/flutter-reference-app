import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/post/post_usecase.dart';
import '../../domain/post/entity/post.dart';
import '../../domain/post/post_repository.dart';
import '../run_usecase_mixin.dart';

/// 投稿ユースケース
class PostUsecaseImpl with RunUsecaseMixin implements PostUsecase {
  PostUsecaseImpl(this.ref) {
    postRepository = ref.read(postRepositoryProvider);
  }
  final Ref ref;
  late PostRepository postRepository;

  /// 新規投稿をする
  @override
  Future<void> addPost({
    required String content,
    required String contributor,
  }) async {
    final post = Post(content: content, contributor: contributor);
    await execute(ref, () => postRepository.addPost(post: post));
  }

  /// 投稿を編集する
  @override
  Future<void> updatePost({
    required String id,
    required String content,
    required String contributor,
  }) async {
    final post = Post(id: id, content: content, contributor: contributor);
    await execute(ref, () => postRepository.updatePost(post: post));
  }

  /// 投稿を削除する
  @override
  Future<void> deletePost({
    required String id,
  }) async {
    await execute(ref, () => postRepository.deletePostFromId(docId: id));
  }
}
