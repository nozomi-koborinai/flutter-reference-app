import 'dart:js_util';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import '../domain_layer/models/post.dart';

///今回の目的はアーキテクチャなのでFirebaseへの接続はしない
///フロント側で適当なデータを生成しておく
class PostRepository implements IPostRepository {
  static final instance = PostRepository._();

  late Stream<List<Post>> dummyPostStream;
  PostRepository._() {
    //ダミーリストの初期化
    // List<Post> list = <Post>[];
    // list.add(const Post('1', '初めての投稿です', 'cobochan'));
    // list.add(const Post('2', '楽しいな〜', 'cobochan'));
    // list.add(const Post('3', '投稿投稿', 'test'));
    // list.add(const Post('4', 'とうこうしました', 'test'));
    // list.add(const Post('5', 'riverpod', 'test'));
    // dummyPostStream = Stream<List<Post>>.value(list);
  }

  //property
  @override
  get postStream => dummyPostStream;

  ///投稿新規追加
  @override
  Future<bool> addPost(Post newPost) async {
    //firebase関連の処理.....
    // await Future.delayed(const Duration(seconds: 3));

    // List<Post> dummyPostList = dummyPostStream.toList() as List<Post>;
    // dummyPostList.add(newPost);
    // dummyPostStream = Stream<List<Post>>.value(dummyPostList);

    FirebaseFirestore.instance
        .collection('posts')
        .add({'content': newPost.content, 'account_id': newPost.accountId});

    //書き込み成功ってことにしておく
    return true;
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
  Future<bool> deletePostFromPostId(String id) async {
    // //firebase関連の処理.....
    // await Future.delayed(const Duration(seconds: 3));

    // List<Post> dummyPostList = dummyPostStream.toList() as List<Post>;
    // dummyPostList.removeWhere((element) => element.id == id);
    // dummyPostStream = Stream<List<Post>>.value(dummyPostList);

    //削除成功ってことにしておく
    return true;
  }

  ///投稿データ全件取得
  @override
  Stream<QuerySnapshot<Post>> fetchPostAll() {
    return FirebaseFirestore.instance
        .collection('posts')
        .withConverter<Post>(
            fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
            toFirestore: (post, _) => post.toJson())
        .snapshots();
  }
}
