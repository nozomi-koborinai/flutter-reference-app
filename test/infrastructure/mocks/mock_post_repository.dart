import 'package:flutter_reference_app/domain/post/entity/post.dart';
import 'package:flutter_reference_app/domain/post/post_repository.dart';

/// テスト用のPostRepository
class MockPostRepository implements PostRepository {
  List<Post> posts = [
    const Post(id: '001', content: '投稿1', contributor: '投稿者1'),
    const Post(id: '002', content: '投稿2', contributor: '投稿者2'),
    const Post(id: '003', content: '投稿3', contributor: '投稿者3'),
    const Post(id: '004', content: '投稿4', contributor: '投稿者4'),
    const Post(id: '005', content: '投稿5', contributor: '投稿者5'),
  ];

  @override
  Future<void> addPost({required Post post}) async {
    posts.add(
      Post(
        id: post.id,
        content: post.content,
        contributor: post.contributor,
      ),
    );
  }

  @override
  Future<void> deletePostFromId({required String docId}) async {
    posts.removeWhere((post) => post.id == docId);
  }

  @override
  void dispose() {}

  @override
  Stream<List<Post>> streamAllPosts() async* {
    yield posts;
  }

  @override
  Future<void> updatePost({required Post post}) async {
    posts[posts.indexWhere((p) => p.id == post.id)] = post;
  }
}
