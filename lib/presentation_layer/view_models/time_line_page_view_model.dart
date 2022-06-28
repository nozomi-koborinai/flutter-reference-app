import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/data_layer/post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/views/post_page.dart';

class TimeLinePageViewModel {
  late WidgetRef _ref;
  final IPostRepository postRepository;

  //providers
  final titleProvider = Provider<String>((ref) => 'タイムライン');
  final postListStreamProvider = StreamProvider.autoDispose((_) {
    CollectionReference ref = FirebaseFirestore.instance.collection('posts');
    return ref.snapshots().map((snapshot) {
      final list = snapshot.docs
          .map((doc) => Post(doc.get('content'), doc.get('account_id')))
          .toList();
      return list;
    });
  });

  //constructor
  //ViewModelインスタンス化時にViewModel内で使用するRepositoryインスタンスをDI
  TimeLinePageViewModel(this.postRepository);

  //初期化
  //view側からWidgetRefをもらう
  void init(WidgetRef ref) {
    _ref = ref;
  }

  ///各Providerのgetter
  get pageTitle => _ref.watch(titleProvider).toString();
  get posts => _ref.watch(postListStreamProvider);

  //投稿ボタン押下時
  Future<void> onPost(BuildContext context) async {
    await postRepository.addPost(const Post('呪術廻戦アニメ２期待てない', 'cobochan'));

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             PostPage(PostPageViewModel(PostRepository.instance))));
  }
}
