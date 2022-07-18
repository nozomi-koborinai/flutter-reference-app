import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/utils/app_values.dart';

class PostRepository implements IPostRepository {
  PostRepository({
    required this.collectionRef,
  });

  final CollectionReference<Map<String, dynamic>> collectionRef;

  ///投稿新規追加
  @override
  Future<void> addPost(Post newPost) async => await collectionRef.add(newPost.toJson());

  ///ユーザIdに紐づく投稿情報を取得
  @override
  Future<List<Post>> fetchPostFromUserId(String id) async {
    throw UnimplementedError('未実装');
  }
}
