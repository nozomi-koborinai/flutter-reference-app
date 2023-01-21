import 'package:riverpod_layered_architecture/domain/models/post.dart';
import 'package:riverpod_layered_architecture/domain/repository_interfaces/i_post_repository.dart';

/// テスト用のRepositoryクラス
class MockPostRepository implements IPostRepository {
  final List<Post> posts = [];

  ///投稿新規追加
  @override
  Future<void> addPost(Post newPost) async {
    posts.add(newPost);
  }

  ///ユーザIdに紐づく投稿情報を取得
  @override
  Future<List<Post>> fetchPostFromUserId(String id) async {
    return posts.where((post) => post.id == id).toList();
  }

  @override
  Future<void> deletePostFromId(String id) async {
    posts.removeWhere((post) => post.id == id);
  }
}
