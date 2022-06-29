import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';

void main() {
  //タイムラインページをテスト
  //モックアップをDIしたViewModelを用いる
  PostPageViewModel postPageVM = PostPageViewModel(MockPostRepository());
}

///テスト用のRepositoryクラス
class MockPostRepository implements IPostRepository {
  late Stream<List<Post>> dummyPostStream;
  MockPostRepository() {
    // ダミーリストの初期化
    List<Post> list = <Post>[];
    list.add(const Post('初めての投稿です', 'cobochan'));
    list.add(const Post('楽しいな〜', 'cobochan'));
    list.add(const Post('投稿投稿', 'test'));
    list.add(const Post('とうこうしました', 'test'));
    list.add(const Post('riverpod', 'test'));
    dummyPostStream = Stream<List<Post>>.value(list);
  }

  ///投稿新規追加
  @override
  Future<void> addPost(Post newPost) async {
    // firebase関連の処理.....
    await Future.delayed(const Duration(seconds: 3));

    List<Post> dummyPostList = dummyPostStream.toList() as List<Post>;
    dummyPostList.add(newPost);
    dummyPostStream = Stream<List<Post>>.value(dummyPostList);
  }

  ///ユーザIdに紐づく投稿情報を取得
  @override
  Future<List<Post>> fetchPostFromUserId(String id) async {
    //firebase関連の処理.....
    await Future.delayed(const Duration(seconds: 3));

    List<Post> dummyPostList = dummyPostStream.toList() as List<Post>;
    return dummyPostList.where((element) => element.accountId == id).toList();
  }

  @override
  // TODO: implement postsCol
  get postsCol => throw UnimplementedError();
}
