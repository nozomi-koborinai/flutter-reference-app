import 'dart:js_util';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import '../domain_layer/models/post.dart';

class PostRepository implements IPostRepository {
  ///postsコレクション
  @override
  get postsCol async => FirebaseFirestore.instance.collection('posts');

  ///投稿新規追加
  @override
  Future<void> addPost(Post newPost) async => await postsCol
      .add({'content': newPost.content, 'account_id': newPost.accountId});

  ///ユーザIdに紐づく投稿情報を取得
  @override
  Future<List<Post>> fetchPostFromUserId(String id) async {
    //TODO：あとから実装
    return null!;
  }
}
