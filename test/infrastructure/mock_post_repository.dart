import 'package:riverpod_layered_architecture/domain/models/post.dart';
import 'package:riverpod_layered_architecture/domain/repositories/post_repository.dart';

/// テスト用のRepositoryクラス
class MockPostRepository implements IPostRepository {
  final List<Post> posts = [];

  @override
  Future<void> addPost({required Post post}) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePostFromId({required String docId}) {
    // TODO: implement deletePostFromId
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<List<Post>> fetchPosts() {
    // TODO: implement fetchPosts
    throw UnimplementedError();
  }

  @override
  Stream<List<Post>> postsChanges() {
    // TODO: implement postsChanges
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost({required Post post}) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
