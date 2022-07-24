import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';

/// テスト用のRepositoryクラス
class MockPostRepository implements IPostRepository {
  final Map<String, Post> data = {};

  void clear() => data.clear();

  void setData(List<Post> posts) {
    int count = 1;
    for (Post post in posts) {
      data[count.toString()] = post;
      count ++;
    }
  }

  ///投稿新規追加
  @override
  Future<void> addPost(Post newPost) async {
    // firebase関連の処理.....
    await Future.delayed(const Duration(seconds: 3));

    data[data.length.toString()] = newPost;
  }

  ///ユーザIdに紐づく投稿情報を取得
  @override
  Future<List<Post>> fetchPostFromUserId(String id) async {
    //firebase関連の処理.....
    await Future.delayed(const Duration(seconds: 3));
    throw UnimplementedError();
    // List<Post> dummyPostList = dummyPostStream.toList() as List<Post>;
    // return dummyPostList.where((element) => element.accountId == id).toList();
  }
  
  @override
  Future<void> deletePostFromId(String id) {
    throw UnimplementedError();
  }
}
