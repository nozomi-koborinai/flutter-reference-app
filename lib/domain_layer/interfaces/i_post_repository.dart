import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';

abstract class IPostRepository {
  get postsCol;
  Future<void> addPost(Post newPost);
  Future<List<Post>> fetchPostFromUserId(String id);
}
