import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';

abstract class IPostRepository {
  //property
  get postStream;

  //method
  Future<bool> addPost(Post newPost);
  Future<List<Post>> fetchPostFromUserId(String id);
  Future<bool> deletePostFromPostId(String id);
  Stream<QuerySnapshot<Post>> fetchPostAll();
}
