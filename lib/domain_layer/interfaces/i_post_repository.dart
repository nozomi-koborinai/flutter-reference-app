import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';

abstract class IPostRepository {
  Future<void> addPost(Post newPost);
  Future<List<Post>> fetchPostFromUserId(String id);
  Future<void> deletePostFromId(String id);
}
