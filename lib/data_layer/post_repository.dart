import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';

class PostRepository implements IPostRepository {
  PostRepository({
    required this.store,
  });

  final FirebaseFirestore store;

  ///投稿新規追加
  @override
  Future<void> addPost(Post newPost) async => await store
      .collection('posts')
      .add({'content': newPost.content, 'account_id': newPost.accountId});

  ///ユーザIdに紐づく投稿情報を取得
  @override
  Future<List<Post>> fetchPostFromUserId(String id) async {
    //TODO：あとから実装
    return null!;
  }
}
