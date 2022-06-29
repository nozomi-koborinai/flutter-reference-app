import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/data_layer/post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/views/post_page.dart';

//providers
final titleProvider = Provider<String>((ref) => 'タイムライン');
late final postListStreamProvider;

class TimeLinePageViewModel {
  late WidgetRef _ref;
  final IPostRepository postRepository;

  //ViewModelインスタンス化時にViewModel内で使用するRepositoryインスタンスをDI
  TimeLinePageViewModel(this.postRepository) {
    //コンストラクタの中でStreamProviderを生成
    postListStreamProvider = StreamProvider.autoDispose((_) {
      return postRepository.postsCol.snapshots().map((snapshot) {
        final list = snapshot.docs
            .map((doc) => Post(doc.get('content'), doc.get('account_id')))
            .toList();
        return list;
      });
    });
  }

  //初期化
  //view側からWidgetRefをもらう
  void init(WidgetRef ref) => _ref = ref;

  //各Providerのgetter（viewとのバインド用）
  get pageTitle => _ref.watch(titleProvider).toString();
  get posts => _ref.watch(postListStreamProvider);

  ///投稿ボタン押下時
  Future<void> onPost(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PostPage(PostPageViewModel(PostRepository()))));
  }
}
